using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using UnityEngine;

namespace Gumfall.EngineEvaluation
{
    public static class Prototype1Runner
    {
        private const int TickRateHz = 60;
        private const int TickCount = 120;
        private const uint Seed = 0x47554D46u;
        private const string SeedId = "xorshift32-0x47554d46-v1";

        [Serializable]
        private sealed class TickRecord
        {
            public int tick;
            public string state_hash;
        }

        [Serializable]
        private sealed class TraceRecord
        {
            public string schema_version = "1.0.0";
            public string candidate = "unity";
            public string source_sha;
            public string engine_version;
            public string seed_id = SeedId;
            public string input_hash;
            public string initial_state_hash;
            public List<TickRecord> ticks = new List<TickRecord>();
            public string final_state_hash;
        }

        [Serializable]
        private sealed class SummaryRecord
        {
            public string mode;
            public int tick_rate_hz;
            public int tick_count;
            public int collision_count;
            public bool engine_physics_participated;
            public string input_hash;
            public string initial_state_hash;
            public string final_state_hash;
        }

        private struct InputRecord
        {
            public int Tick;
            public int AAccel;
            public int BAccel;
        }

        private struct SimState
        {
            public int APosition;
            public int AVelocity;
            public int BPosition;
            public int BVelocity;
            public bool CollisionOccurred;
            public int CollisionCount;
        }

        public static void Run()
        {
            string[] args = Environment.GetCommandLineArgs();
            string mode = RequireArg(args, "-gumfallMode");
            string tracePath = RequireArg(args, "-gumfallTracePath");
            string inputPath = RequireArg(args, "-gumfallInputPath");
            string summaryPath = RequireArg(args, "-gumfallSummaryPath");
            string sourceSha = RequireArg(args, "-gumfallSourceSha");

            if (!string.Equals(mode, "baseline", StringComparison.OrdinalIgnoreCase) &&
                !string.Equals(mode, "replay", StringComparison.OrdinalIgnoreCase))
            {
                throw new InvalidOperationException("gumfallMode must be baseline or replay.");
            }

            if (!Regex.IsMatch(sourceSha, "^[0-9a-fA-F]{40}$"))
            {
                throw new InvalidOperationException("gumfallSourceSha must be a 40-character hexadecimal Git SHA.");
            }

            EnsureParent(tracePath);
            EnsureParent(inputPath);
            EnsureParent(summaryPath);

            List<InputRecord> inputs;

            if (string.Equals(mode, "baseline", StringComparison.OrdinalIgnoreCase))
            {
                inputs = GenerateInputs();
                WriteInputs(inputPath, inputs);
            }
            else
            {
                inputs = ReadInputs(inputPath);
            }

            string inputHash = HashBytes(File.ReadAllBytes(inputPath));
            SimState state = CreateInitialState();
            string initialStateHash = HashState(0, state);

            var trace = new TraceRecord
            {
                source_sha = sourceSha.ToLowerInvariant(),
                engine_version = Application.unityVersion,
                input_hash = inputHash,
                initial_state_hash = initialStateHash
            };

            for (int i = 0; i < inputs.Count; i++)
            {
                InputRecord input = inputs[i];
                Step(ref state, input);
                trace.ticks.Add(new TickRecord
                {
                    tick = input.Tick,
                    state_hash = HashState(input.Tick, state)
                });
            }

            if (state.CollisionCount != 1)
            {
                throw new InvalidOperationException(
                    "Prototype scenario must execute exactly one bounded entity collision. Observed: " +
                    state.CollisionCount.ToString(CultureInfo.InvariantCulture));
            }

            trace.final_state_hash = trace.ticks[trace.ticks.Count - 1].state_hash;

            var summary = new SummaryRecord
            {
                mode = mode.ToLowerInvariant(),
                tick_rate_hz = TickRateHz,
                tick_count = inputs.Count,
                collision_count = state.CollisionCount,
                engine_physics_participated = false,
                input_hash = inputHash,
                initial_state_hash = initialStateHash,
                final_state_hash = trace.final_state_hash
            };

            WriteUtf8NoBom(tracePath, JsonUtility.ToJson(trace, true) + "\n");
            WriteUtf8NoBom(summaryPath, JsonUtility.ToJson(summary, true) + "\n");

            Debug.Log(
                "GUMFALL Prototype 1 " + mode +
                " complete. ticks=" + inputs.Count.ToString(CultureInfo.InvariantCulture) +
                " collision_count=" + state.CollisionCount.ToString(CultureInfo.InvariantCulture) +
                " final_state_hash=" + trace.final_state_hash);
        }

        private static SimState CreateInitialState()
        {
            return new SimState
            {
                APosition = -8000,
                AVelocity = 120,
                BPosition = 8000,
                BVelocity = -110,
                CollisionOccurred = false,
                CollisionCount = 0
            };
        }

        private static List<InputRecord> GenerateInputs()
        {
            var records = new List<InputRecord>(TickCount);
            uint state = Seed;

            for (int tick = 1; tick <= TickCount; tick++)
            {
                records.Add(new InputRecord
                {
                    Tick = tick,
                    AAccel = (int)(NextUInt(ref state) % 3u) - 1,
                    BAccel = (int)(NextUInt(ref state) % 3u) - 1
                });
            }

            return records;
        }

        private static uint NextUInt(ref uint state)
        {
            unchecked
            {
                state ^= state << 13;
                state ^= state >> 17;
                state ^= state << 5;
                return state;
            }
        }

        private static void Step(ref SimState state, InputRecord input)
        {
            state.AVelocity = Clamp(state.AVelocity + input.AAccel, -200, 200);
            state.BVelocity = Clamp(state.BVelocity + input.BAccel, -200, 200);
            state.APosition += state.AVelocity;
            state.BPosition += state.BVelocity;

            if (!state.CollisionOccurred && state.APosition >= state.BPosition)
            {
                int midpoint = (state.APosition + state.BPosition) / 2;
                int oldAVelocity = state.AVelocity;
                state.APosition = midpoint - 1;
                state.BPosition = midpoint + 1;
                state.AVelocity = state.BVelocity;
                state.BVelocity = oldAVelocity;
                state.CollisionOccurred = true;
                state.CollisionCount++;
            }
        }

        private static int Clamp(int value, int min, int max)
        {
            if (value < min)
                return min;
            if (value > max)
                return max;
            return value;
        }

        private static void WriteInputs(string path, List<InputRecord> inputs)
        {
            var builder = new StringBuilder();
            builder.Append("tick,a_accel,b_accel\n");

            for (int i = 0; i < inputs.Count; i++)
            {
                InputRecord item = inputs[i];
                builder.Append(item.Tick.ToString(CultureInfo.InvariantCulture));
                builder.Append(',');
                builder.Append(item.AAccel.ToString(CultureInfo.InvariantCulture));
                builder.Append(',');
                builder.Append(item.BAccel.ToString(CultureInfo.InvariantCulture));
                builder.Append('\n');
            }

            WriteUtf8NoBom(path, builder.ToString());
        }

        private static List<InputRecord> ReadInputs(string path)
        {
            if (!File.Exists(path))
                throw new FileNotFoundException("Recorded input sequence not found.", path);

            string[] lines = File.ReadAllText(path, Encoding.UTF8)
                .Replace("\r", string.Empty)
                .Split(new[] { '\n' }, StringSplitOptions.RemoveEmptyEntries);

            if (lines.Length != TickCount + 1 ||
                !string.Equals(lines[0], "tick,a_accel,b_accel", StringComparison.Ordinal))
            {
                throw new InvalidOperationException("Recorded input sequence has an unexpected shape.");
            }

            var records = new List<InputRecord>(TickCount);

            for (int i = 1; i < lines.Length; i++)
            {
                string[] parts = lines[i].Split(',');
                if (parts.Length != 3)
                    throw new InvalidOperationException("Malformed input row: " + lines[i]);

                int tick = int.Parse(parts[0], CultureInfo.InvariantCulture);
                if (tick != i)
                    throw new InvalidOperationException("Input tick sequence is not contiguous.");

                records.Add(new InputRecord
                {
                    Tick = tick,
                    AAccel = int.Parse(parts[1], CultureInfo.InvariantCulture),
                    BAccel = int.Parse(parts[2], CultureInfo.InvariantCulture)
                });
            }

            return records;
        }

        private static string HashState(int tick, SimState state)
        {
            string canonical = string.Format(
                CultureInfo.InvariantCulture,
                "{0}|{1}|{2}|{3}|{4}|{5}|{6}",
                tick,
                state.APosition,
                state.AVelocity,
                state.BPosition,
                state.BVelocity,
                state.CollisionOccurred ? 1 : 0,
                state.CollisionCount);

            return HashBytes(Encoding.UTF8.GetBytes(canonical));
        }

        private static string HashBytes(byte[] bytes)
        {
            using (SHA256 sha = SHA256.Create())
            {
                byte[] digest = sha.ComputeHash(bytes);
                var builder = new StringBuilder(digest.Length * 2);
                for (int i = 0; i < digest.Length; i++)
                    builder.Append(digest[i].ToString("x2", CultureInfo.InvariantCulture));
                return builder.ToString();
            }
        }

        private static string RequireArg(string[] args, string name)
        {
            for (int i = 0; i < args.Length - 1; i++)
            {
                if (string.Equals(args[i], name, StringComparison.OrdinalIgnoreCase))
                    return args[i + 1];
            }

            throw new InvalidOperationException("Required command-line argument missing: " + name);
        }

        private static void EnsureParent(string path)
        {
            string parent = Path.GetDirectoryName(Path.GetFullPath(path));
            if (!string.IsNullOrWhiteSpace(parent))
                Directory.CreateDirectory(parent);
        }

        private static void WriteUtf8NoBom(string path, string content)
        {
            File.WriteAllText(path, content, new UTF8Encoding(false));
        }
    }
}
