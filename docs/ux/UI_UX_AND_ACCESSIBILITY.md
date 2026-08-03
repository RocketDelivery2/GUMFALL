# UI, UX, and Accessibility

> **Status:** PROPOSED — Design targets for the user interface, user experience, and
> accessibility systems. Accessibility minimums in Section 4 are ASSUMPTION per A-007.
> Last updated: 2026-08-03 | Authority: [DESIGN_AUTHORITY.md](../governance/DESIGN_AUTHORITY.md)

---

## Overview

GUMFALL's UI must communicate the state of a physically complex simulation clearly and without
ambiguity. The body integrity system, directional combat, per-region armor, and status effects
all require visual representation. Clarity is not optional — if a player cannot read what is
happening to their character's body, the physical consequence design fails.

Accessibility is a first-class design concern. See A-007 in
[ASSUMPTION_REGISTER.md](../governance/ASSUMPTION_REGISTER.md) for the minimum accessibility
target.

---

## 1. UI Design Philosophy

### 1.1 Diegetic First

Where possible, information is communicated through the game world rather than HUD overlays.
The visual deformation of a body region communicates structural damage. Embedded objects are
visible on the character model. Crystallization is visible as a texture change.

The HUD supplements diegetic information — it does not replace it. Players must be able to
function with a minimal HUD if they choose to.

### 1.2 No Health-Bar Abstraction

GUMFALL does not use a single global health bar as the primary combat feedback mechanism.
Global vitality exists but is secondary to per-region structural state. The HUD must
communicate per-region state in a way that is readable during combat.

This is a **VERIFIED** design constraint derived from Core Pillar 4 (Physical consequences)
and the body integrity system (DEC-002).

### 1.3 Scalability

UI elements must scale to support different display sizes, aspect ratios, and UI scale
preferences. A player on a large monitor and a player on a laptop must both be able to read
the body integrity display clearly.

---

## 2. HUD Design (PROPOSED)

### 2.1 Core HUD Elements

| Element | Location | Description |
|---|---|---|
| Body integrity display | Lower-left or lower-center | Per-region structural state, color-coded by condition |
| Class resource bar | Adjacent to body integrity display | Current/maximum resource (e.g., Edge Alignment pips) |
| Stamina indicator | Near body integrity | Stamina pool, depleted/recovering state |
| Active status effects | Body region display overlay or nearby strip | Active effects with region association if applicable |
| Target body display | Lower-right or center-right | Enemy body integrity state (visible regions only) |
| Equipment quick-view | Bottom-center (toggle) | Currently equipped items, condition indicator |

### 2.2 Body Integrity Display

The body integrity display is the most critical HUD element. Design requirements:

- **Per-region state:** At minimum 6 regions (head, torso, left arm, right arm, left leg, right leg) for humanoid characters and monsters. Non-humanoid monsters have anatomy-appropriate regions.
- **Color coding:** Region color shifts from healthy to warning to critical as local structure depletes. Colors must be colorblind-safe (see Section 4).
- **Connection strength indicator:** When a region's connection strength is degrading, a visual warning (pulsing border, instability indicator) appears around that region in the display.
- **Separated region state:** A region that has been separated from the body is shown as disconnected in the display with a distinct visual treatment.
- **Embedded objects:** An embedded object indicator (small icon or count) appears on the region.

### 2.3 Class Resource Display

Each of the 12 classes has a distinct resource. The resource display must:
- Be readable at a glance
- Communicate both current value and capacity
- Support the distinct mechanical character of each resource
  - Pips (Edge Alignment, 0–5 or 0–max)
  - Fill bar with markers (Focus Marks, stacked)
  - Continuous gauge (Momentum, Leverage)
  - Charge counters (Flavor Charges, Ingredients)

### 2.4 Target UI

When a target is engaged, the target's body integrity display appears. This supports:
- Core Pillar 7 (Anatomy-driven encounters): players can see which regions to target
- Directional combat decision-making: which regions are armored vs. exposed

Target body display shows what is **observable** by the player character in the simulation —
concealed or back-facing regions may not be fully shown.

---

## 3. Menu and Inventory Design (PROPOSED)

### 3.1 Character Screen

The character screen displays:
- Full character model with equipment shown in place
- Per-region armor coverage visualization
- Attribute values with source breakdown (base + lineage + equipment)
- Derived stats
- Class resource and specialty information

### 3.2 Inventory

- Slot-based inventory with item weight/bulk constraint (PROPOSED: bulk system, not finalized)
- Equipment comparison view: show stat delta when hovering over unequipped item
- Body region mapping: when hovering over an armor piece, highlight the region it covers on the character model

### 3.3 Ability and Specialty Screen

- Visual ability graph showing available abilities and their connections
- Specialty path visualization
- Level feature timeline at the bottom of the screen

---

## 4. Accessibility Requirements (ASSUMPTION — A-007)

The following are minimum accessibility requirements derived from A-007. They are **not yet
confirmed** by the Design Authority. Treat as targets.

**NOT PERFORMED:** Accessibility user testing. All values below are design targets.

### 4.1 Colorblind Support

- All damage-type indicators in the body integrity display and combat feedback must have
  a non-color secondary indicator (pattern, icon, or shape).
- The body integrity display must offer a colorblind-safe palette option.
  Minimum supported modes: Deuteranopia, Protanopia, Tritanopia.
- Status effect icons must not rely on color alone to convey type.

### 4.2 Input Remapping

- **All** player actions must be remappable. No hardcoded key or button bindings.
- Remapping applies to keyboard, mouse, and controller inputs independently.
- Multiple inputs may be bound to the same action.
- Directional combat inputs (attack direction, parry direction) must support alternative
  input modes for players who cannot use analog stick precision (e.g., face-button
  directional mode).

### 4.3 Captions and Subtitles

- All voiced dialogue must have subtitle/caption support.
- Captions must include speaker identification.
- Captions must include relevant non-speech audio cues in brackets (e.g., "[heavy impact]").
- Caption font size must be adjustable from the accessibility menu.

### 4.4 UI Scale

- All HUD elements must support UI scale adjustment from 50% to 200% of default size.
- The body integrity display must remain readable at 50% scale on a 1080p display
  (minimum legibility target).

### 4.5 Timing Accommodation

- Input buffers for combat actions (target: 150ms per design value; see GelFlow spec)
  must support extension for players who need longer buffer windows.
- UNKNOWN: Maximum supported input buffer extension value. Requires gameplay testing.
- The GelFlow combat system must expose a difficulty scaling mechanism that adjusts
  timing windows without altering the physics simulation.

### 4.6 Screen Reader Compatibility

**UNKNOWN.** Screen reader support for menu navigation is not yet designed. The Design
Authority must make a decision on screen reader scope before menu architecture is finalized.

### 4.7 Motion Sensitivity

- A reduced-motion option must reduce or eliminate non-essential screen-shake,
  camera-bob, and environmental animation.
- Core gameplay visual feedback (body region deformation, embedded objects) is exempt
  from reduced-motion — these communicate gameplay state that affects decisions.

---

## 5. UX Flow Design (PROPOSED)

### 5.1 New Player Experience

1. Character creation: lineage selection, composition, flavor affinity, background, class
2. Tutorial zone introduction: GelFlow combat basics, body integrity display orientation,
   first armor equip, first weapon equip
3. Camp hub introduction: Sugar Well, crafting access, first NPC interaction
4. First encounter: Sugar Wolf pack (1–2 wolves, manageable)
5. First body region damage feedback tutorial trigger (context-sensitive)
6. First specialty selection at Level 3

### 5.2 Returning Player Session Start

On session start, present:
- Character state summary (level, active status, quests, location)
- Weekly challenge indicator if new challenges are available
- No forced interruption — all summary information is dismissible

### 5.3 Combat UX Responsiveness

All UI elements that communicate combat state must update within one simulation tick
of the event that caused the change. Latency in UI updates that delay player reaction
is a gameplay flaw, not a cosmetic issue.

---

## Related Documents

- [Audio and Music](../audio/AUDIO_AND_MUSIC.md) — Audio accessibility requirements
- [Body Integrity](../systems/BODY_INTEGRITY.md) — Region state displayed in HUD
- [GelFlow Combat](../systems/GELFLOW_COMBAT.md) — Combat system driving HUD updates
- [Classes and Specialties](../game-design/CLASSES_AND_SPECIALTIES.md) — Class resource display
- [ASSUMPTION_REGISTER.md](../governance/ASSUMPTION_REGISTER.md) — A-007 (accessibility)
- [DECISION_LOG.md](../governance/DECISION_LOG.md) — DEC-002 (simulation/presentation separation)
- [AGENTS.md](../../AGENTS.md) — Authority labels
