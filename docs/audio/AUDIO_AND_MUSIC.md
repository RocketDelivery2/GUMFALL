# Audio and Music

> **Status:** PROPOSED — Design targets for audio direction and system architecture. Individual
> values and implementation approaches are not yet finalized.
> Last updated: 2026-08-03 | Authority: [DESIGN_AUTHORITY.md](../governance/DESIGN_AUTHORITY.md)

---

## Overview

GUMFALL's audio system must reinforce the physical, tactile nature of a gummy-candy world.
Every sound is derived from material reality: what a body is made of, what struck it, and
how hard. The audio design shares the same source-grounding principle as loot and world design
(Core Pillar 8). Sounds that do not arise naturally from the material and context do not belong.

This document covers:
- Audio design philosophy
- GelFlow combat sound design
- Music direction and adaptive music system
- World and ambient audio
- UI and feedback audio
- Accessibility requirements for audio
- Technical constraints (engine-neutral)

---

## 1. Audio Philosophy

**PROPOSED.** Subject to revision when engine and audio middleware are selected.

### 1.1 Material-Driven Sound

All impact sounds are derived from the materials involved:

| Material Interaction | Audio Character |
|---|---|
| Soft-set gummy against hard surface | Wet thud, resonant bounce |
| Firm-set gummy sliced | Clean separation tone, slight suction release |
| Crystalline gummy shattered | High-frequency crack, splintering |
| Bronze armor struck | Metallic ring, dampened by gummy backing |
| Weapon embedding in gummy tissue | Squelch-sink, brief adhesion resonance |

### 1.2 Spatial Audio

Combat audio must communicate directional information clearly enough to support competitive
play. Players must be able to locate incoming attacks by sound alone in a well-tuned audio
environment. ASSUMPTION: target platform supports 3D positional audio at sufficient fidelity
for this requirement (see A-001).

### 1.3 Readability

Combat sounds must be distinct enough that a player can identify:
- Attack type (slice, pierce, crush)
- Hit confirmation vs. block/deflection vs. miss
- Body region struck
- Status effect onset (crystallization, burning, adhesion)

This supports Core Pillar 3 (Readable impacts) as an audio layer parallel to visual impacts.

---

## 2. GelFlow Combat Sound Design

### 2.1 Damage Type Audio Signatures

**PROPOSED design targets:**

| Damage Type | Primary Audio Characteristic |
|---|---|
| Slice | Clean separation, material-appropriate release tone |
| Pierce | Entry squish, resonant cavity hum on deep penetration |
| Crush | Dense thud, structural creak on body-region compression |
| Heat | Sizzle onset, caramelization crackle at high temperature |
| Cold | Crystallization ping, brittle overtone on frozen material |
| Sour | Acidic hiss, dissolution fizz |
| Sugar | Sweet resonance, brief crystalline shimmer |
| Shock | Sharp electric crack, secondary body vibration |
| Spirit | Low harmonic drone, otherworldly undertone |

### 2.2 Body Region Events

Each body region separation event has a distinct sound:

- **Connection strength degradation:** Increasing stress sound as connection approaches threshold.
- **Separation:** Region-specific pop/tear/snap based on material composition.
- **Reattachment:** Adhesion reunion tone, pressure equalization, connection lock cue.
- **Embedded object:** Entry confirmation, per-tick resonance while embedded, exit sound.

### 2.3 Edge Alignment (Edgebearer Resource)

- Alignment gain: subtle harmonic accumulation tone (quiet, directional)
- Alignment at maximum: sustained resonant hum, barely audible in combat noise
- Perfect Form activation: brief silence and reset, then resonant impact on next strike
- Alignment loss: dissonant release tone

### 2.4 Focus Marks (Pinshot Resource)

- Mark placement: soft click-lock sound (positional to target)
- Mark detonation: orchestrated burst if multiple marks fire in sequence
- Convergence Shot: full-silence pre-fire beat, then layered detonation

---

## 3. Music Direction

### 3.1 Direction Statement

**PROPOSED.** The music of GUMFALL is the music of something alive that should not be dangerous
but is. The candy world is viscerally beautiful — rich, sweet, strange — and also genuinely
threatening. The score must hold both tones simultaneously without irony.

### 3.2 Adaptive Music System

**ASSUMPTION:** The selected audio middleware supports a layered adaptive music system with
per-layer dynamic volume and blend control (see A-001 for engine dependency).

The adaptive system responds to:

| Context Signal | Music Response |
|---|---|
| Exploration (safe zone) | Ambient-forward, melodic, low percussion |
| Exploration (unknown zone) | Rhythmic undertone rises, melody recedes |
| Combat detected | Percussion layer rises, harmonic tension increases |
| Combat active | Full combat layer, intensity tracks encounter phase |
| Elite/Captain encounter | Thematic variant with distinct identity motif |
| Royal Court zone | Region-specific thematic material (see Section 5) |
| Low health | Subtle tonal shift toward minor register |
| Victory / encounter complete | Exhale phrase, return to ambient |

### 3.3 Biome and Region Themes

Each major world region has a distinct musical palette that reflects its material nature.
**PROPOSED examples:**

- **Caravan Quarter:** Busy, percussive, market energy; multiple layers of overlapping melodic fragments
- **Sour Waste:** Dissonant, sparse; acidic overtones in string or wind analogues
- **Sugarspire Mountains:** Crystalline, high-register; percussive crystallization sounds as instrument
- **Shattercrown:** Dangerous tension layer always present; faction motifs overlay on proximity

### 3.4 Royal Court Musical Identity

Each Royal Court has a distinct musical identity. These identities must be established in the
public-facing zones before the Court is entered, so the player associates the theme with the
presence of something powerful. The themes may be referenced in public documentation; exact
internal arrangements are design-private material.

---

## 4. World and Ambient Audio

### 4.1 Ambient Layers

World ambient audio is composed of at least three layers:

1. **Environmental foundation:** Persistent atmospheric tone tied to biome material (e.g., sugar crystal wind resonance in Sugarspire Mountains)
2. **Ecological foreground:** Creature sounds, environmental events (sugar rain, caramel flow)
3. **Player-proximity reactive:** Sounds that shift based on what the player is adjacent to or doing

### 4.2 Day/Night Cycle Audio

**ASSUMPTION (A-003 dependency):** If a day/night cycle exists, ambient audio cycles through at
minimum a daytime and nighttime layer. Night layers reduce ecological foreground and introduce
ambient threat undertone in contested zones.

### 4.3 Camp and Safe Zone Audio

At the camp (vertical slice safe zone), music recedes to ambient only. This creates a deliberate
audio safe-space that reinforces the mechanical safety. The Sugar Well has a distinct soft tone
tied to its restoration function.

---

## 5. UI and Feedback Audio

**PROPOSED design targets.** All UI sounds must be unobtrusive in combat.

| UI Event | Sound Character |
|---|---|
| Menu open/close | Soft candy-material click |
| Inventory item equip | Material contact confirmation |
| Level up | Ascending harmonic phrase (distinct, brief) |
| Specialty unlock | Richer ascending phrase, slightly longer |
| Quest milestone | Musical sting, 2–3 second phrase |
| Loot drop (common) | Soft chime |
| Loot drop (rare+) | Distinct ascending tone, clearly audible above combat |
| Damage taken (UI feedback) | Region-specific pulse mapped to body integrity display |

---

## 6. Accessibility Requirements for Audio

These requirements align with A-007 (accessibility assumption):

- **Visual audio indicators:** All gameplay-critical sounds (combat hit confirmation, status effect onset, body region separation) must have a parallel visual indicator for players with hearing impairments.
- **Closed captions:** All voiced content (dialogue, NPC lines, environmental story-telling) must have subtitle/caption options. Captions must include speaker identification and relevant non-speech audio cues (e.g., "[nearby glass shattering]").
- **Volume controls:** Separate volume controls are required for: master, music, combat SFX, ambient SFX, UI sounds, voice/dialogue.
- **Audio-visual mapping options:** The body integrity display must have an audio-to-visual indicator mode where damage state is conveyed through screen-edge visual effects in addition to sound, for players who benefit from redundant feedback.
- **Combat audio toggle:** Option to reduce combat audio density for players who find high-density combat audio disorienting.

**NOT PERFORMED:** Accessibility user testing. These requirements are design targets derived from A-007.

---

## 7. Technical Constraints (Engine-Neutral)

The following requirements apply regardless of which audio middleware is selected:

1. **Simulation/presentation separation (DEC-002):** Audio is a presentation layer. Audio events are triggered by simulation state changes — never the reverse.
2. **Determinism:** Audio events must never influence simulation state. Replays must reproduce audio from the same simulation state without storing audio data.
3. **Positional audio:** All combat audio must support 3D positional audio with correct attenuation curves.
4. **Layered adaptive system:** Music system must support per-layer volume and blend control with sub-second blend times.
5. **Priority queuing:** Combat audio must have clear priority rules to prevent voice-channel exhaustion during large encounters.
6. **Accessibility hooks:** Audio system must expose per-category volume control and visual-indicator triggering.

---

## Related Documents

- [UI, UX, and Accessibility](../ux/UI_UX_AND_ACCESSIBILITY.md) — Visual accessibility requirements
- [GelFlow Combat](../systems/GELFLOW_COMBAT.md) — Combat simulation (audio is presentation layer only)
- [Body Integrity](../systems/BODY_INTEGRITY.md) — Region separation events that trigger audio
- [ASSUMPTION_REGISTER.md](../governance/ASSUMPTION_REGISTER.md) — A-001, A-003, A-007
- [DECISION_LOG.md](../governance/DECISION_LOG.md) — DEC-002 (simulation/presentation separation)
- [AGENTS.md](../../AGENTS.md) — Authority labels
