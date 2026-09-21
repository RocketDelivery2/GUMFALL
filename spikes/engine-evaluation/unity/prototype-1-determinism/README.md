# Unity Prototype 1 — Deterministic Simulation Spike

**Status:** ENGINE EVALUATION SPIKE / NOT AN ENGINE SELECTION

This isolated spike exists only to execute GUMFALL engine-evaluation Prototype 1 for Unity.

It intentionally keeps authoritative simulation separate from Unity presentation and physics. The authoritative state uses integer position/velocity values and a fixed 60 Hz tick contract. The baseline run creates a deterministic seeded input sequence and records it. A second Unity Editor process replays that exact recorded input sequence. Both runs emit technology-neutral trace JSON for the repository comparator.

The scenario contains two simulated entities and exactly one bounded entity collision. Unity physics does not participate in authoritative resolution.

A same-platform PASS proves only that this tested Unity-hosted controlled simulation replayed without authoritative-state divergence. It does not prove cross-platform determinism, production performance, networking correctness, or suitability of Unity as the final engine. DEC-001 remains OPEN.

Execution evidence belongs under evidence/engine-evaluation/unity/prototype-1-determinism/ and must be generated from an exact committed source SHA.
