# GUMFALL — GelFlow Combat System
**Status:** VERIFIED (pipeline structure, phase names, input buffer design values, cancel categories, targeting modes) / PROPOSED (specific timing values, camera rules)
**Cross-references:** [Body Integrity](BODY_INTEGRITY.md) · [Damage, Status, and Armor](DAMAGE_STATUS_AND_ARMOR.md) · [Classes and Specialties](../game-design/CLASSES_AND_SPECIALTIES.md) · [Attributes and Stats](../game-design/ATTRIBUTES_AND_STATS.md)

---

## 1. Philosophy and Design Intent

GelFlow combat is built on a single foundational principle: **the body is the game**.

In most action games, the character is a vessel for abilities. In GUMFALL, the character's physical body is the primary system — its material properties, its regional integrity, its deformation state, its attachment to its own limbs. Combat is the process by which the physical reality of two gummy bodies interacts.

**Design consequences of this principle:**
1. Visual presentation must never determine gameplay outcomes. A body region that looks heavily damaged but has not crossed its simulation threshold is still mechanically intact.
2. Dodging means physically not being in a location. It is real displacement — not a damage immunity frame.
3. Parrying means correctly timing an intercepting action. The quality of the parry determines the quality of the outcome.
4. Limb separation is a real physical event with ongoing consequences — not a status effect.

**What GelFlow is not:**
- Not a frame-perfect input system where reaction-speed reflexes are the primary skill
- Not a system where numbers matter more than positioning

**What GelFlow is:**
- A physics-grounded system where material properties, positioning, and body-region decision-making are the primary skill expressions

---

## 2. Full Ordered Simulation Pipeline

The GelFlow simulation processes every combat action through 11 ordered steps. No step may skip based on visual presentation.

### Step 1: Input Intent

Player or AI declares an intended action. Player inputs are buffered (Section 6). AI submits via utility scoring.

**Outputs:** Action declaration with action type, direction/targeting intent, character state.

### Step 2: Action Validation

Declared action checked against current state: animation state, resource availability, status effect restrictions, cancel availability.

**Outputs:** Action confirmed, modified, or rejected.

### Step 3: Character Movement

Movement involved in the action is resolved: dodge displacement, charge traversal, normal movement. Collision with terrain/characters during traversal resolved here.

**Outputs:** Character's new physical position. Updated collision state.

### Step 4: Contact Detection

Checks spatial overlap between attacking hitbox and target bodybox. Contact is phase-dependent — only Active phase attacks generate contact. Projectile contact resolved here.

**Outputs:** Contact yes/no. If yes: contact point on target's body (which region), angle, relative velocity.

### Step 5: Defense Resolution

Evaluates the defending character's defensive actions at the moment of contact:
- **Parry:** Was a parry action in its valid window? Which quality tier? (Section 11)
- **Block:** Was a block stance active? What coverage vs. attack direction?
- **Dodge invulnerability (NONE):** Dodge is real displacement — no iframes.

**Outputs:** Defense outcome — undefended, blocked, parried (with quality tier).

### Step 6: Attack Energy

For undefended or partially defended contacts:

**Formula (VERIFIED):**
`Attack Energy = Base Force × Motion × Attribute × Ability Modifier`

- **Base Force** = weapon's base force rating
- **Motion** = attack's motion multiplier (charge vs. standing vs. momentum-assisted)
- **Attribute** = relevant attribute scaling (Might for melee, Agility for ranged)
- **Ability Modifier** = active class ability or status modifier

**Outputs:** Raw Attack Energy value.

### Step 7: Armor Resolution

Attack energy passes through target's armor at the struck region. Four possible outcomes (VERIFIED):

1. **Deflection:** Geometry redirects attack. Reduced damage; possible force transfer.
2. **Absorption:** Armor absorbs energy. Reduced body damage; armor condition degrades.
3. **Penetration:** Energy exceeds resistance. Full/partial energy reaches body region; armor degrades.
4. **Force Transfer:** Does not penetrate but force transfers through armor (Crush through heavy armor).

**Outputs:** Damage energy reaching body region. Armor condition damage.

### Step 8: Body-Region Resolution

Resolved damage energy applied to the struck body region's tracked properties:

Damage channels by type:
- **Core Vitality damage:** Most attack types; reduces total Vitality
- **Regional Structure damage:** Reduces body region structural integrity; accumulates toward separation threshold
- **Stability damage:** Reduces Stability for this frame; if depleted, triggers stagger
- **Status Buildup:** Adds to relevant status accumulation counter

**Outputs:** Updated body region state. Updated Vitality, Stability, status buildup counters.

### Step 9: Threshold and Status Resolution

All tracked values checked against thresholds:
- **Limb Separation Threshold:** Regional structure at threshold → separation event
- **Status Effect Activation:** Buildup counter at activation threshold → status applied
- **Crisis State Thresholds:** Vitality/Stamina crisis states
- **Knock Down:** Stability at zero → knock-down event

**Outputs:** Event list (separations, status applications, crisis state changes, knock-downs).

### Step 10: Reaction Selection

Based on Step 9 events, defending character selects and executes reactions:
- Stagger/knockdown animation
- Limb separation event (detachment animation, physics placement)
- Status application visual
- Counter-reaction class abilities (Bounce builds for Gummy Brawler, Counter-Edge for Edgebearer)

**Outputs:** Reaction animation selection. Resource changes from reaction triggers.

### Step 11: Presentation

Visual, audio, and haptic presentation rendered from simulation outputs. **Presentation never determines outcomes.** The visual layer communicates results; it does not change them.

Body deformation, limb separation, and status visuals must match simulation outputs exactly. Contradictions between simulation and presentation are bugs.

---

## 3. Character Motor

The Character Motor translates player inputs into character state. It manages:
- Current animation state and available actions
- Input buffer (holding recent inputs against window durations — Section 6)
- Cancel availability given current state
- Stamina and resource enforcement

The Character Motor is authoritative. If it says an action is unavailable, it is unavailable regardless of visual presentation.

---

## 4. Ability Graph Overview

Each character has an Ability Graph — a network of available actions and the transitions between them. Defined by:
- Class abilities (class and specialty)
- Weapon-dependent abilities (some require specific weapon types)
- State-dependent abilities (only available from specific states)
- Resource-gated abilities (minimum resource levels)

Injury to body regions can remove nodes from the Ability Graph. See [Body Integrity](BODY_INTEGRITY.md) for limb-loss consequences.

---

## 5. State Groups and Transitions

| State Group | Description | Available Actions |
|-------------|-------------|------------------|
| Grounded | Standing/walking on stable surface | All standard actions |
| Airborne | In the air | Limited: some aerial abilities; no heavy grounded attacks |
| Staggered | Recovering from stagger/knockdown | Stagger recovery; Emergency cancel possible |
| Grappled | Held by another character | Escape attempts only |
| Downed | On ground after knockdown | Get-up animation; vulnerable to attack |
| Incapacitated | Vitality at zero | No player actions; requires revival |
| Status-Locked | Frozen, Pinned, etc. | Limited to status-escape actions |

---

## 6. Input Buffering

**Status: DESIGN VALUES — NOT PERFORMED. Targets for implementation; not verified runtime results.**

| Input Type | Buffer Window | Notes |
|------------|--------------|-------|
| Light Attack | 150ms | From any valid state |
| Heavy Attack | 180ms | Requires 50ms charge hold |
| Dodge | 180ms | Directional input determines direction |
| Parry | 120ms | Narrowest — parry is highest-skill timing action |
| Weapon Switch | 200ms | Can buffer while in attack animation |
| Interaction | 250ms | Widest — accessibility consideration |

**Design Rationale:** Parry has the narrowest buffer (120ms) because parry quality is skill-expressive. Widening the buffer would reduce distinction between quality tiers. Dodge is moderate (180ms) because it is real displacement — timing matters but millisecond imprecision should not be punished.

**Accessibility:** Buffer windows may be extended in accessibility settings (PROPOSED: up to 2× design values).

---

## 7. Attack Phases

### Preparation
Character readies the attack. No hitbox. Character is committed but not yet active. Character is vulnerable. Readable by defender.

### Startup
Attack motion has begun. Weapon in motion but Active window not yet reached. No hitbox. Very short for light attacks; longer for heavy. Cannot normally be cancelled.

### Active
Hitbox is active. Contact detection (Step 4) runs. Multi-hit attacks have multiple Active sub-windows.

Duration design principle: Too long = too safe; too short = too punishing to miss with.

### Recovery
Attack is complete; character returning to neutral. No hitbox. Long recovery = vulnerable for extended period. Recovery length is the primary risk cost of heavy attacks and the primary balancing lever for attack power.

---

## 8. Cancel Categories

### Movement Cancel
Interrupt attack with movement action. Available from: Preparation, some Recovery states. Not from: Startup, Active, Staggered, Downed.

### Attack Cancel
Interrupt one attack with another (combo continuation). Available from: End of Active phase into next attack. Rules: combo cancel timing is weapon-specific.

### Defensive Cancel
Interrupt attack with defensive action (block raise, parry). Available from: Preparation, early Recovery. Not from: Active, Staggered.

### Weapon Cancel
Switch active weapon mid-animation. Available from: Preparation, Recovery. Not from: Active, Staggered, Downed. Weapon switch animation plays; 200ms buffer applies.

### Ability Cancel
Interrupt with class ability. Availability is state-dependent by individual ability. Cost: ability resource requirement.

### Emergency Cancel
Highest-priority cancel. Interrupts almost any state including stagger (with appropriate upgrade). Not from: Incapacitated, Downed (get-up first). Significant Stamina cost — designed to make routine use uneconomical.

---

## 9. Targeting Modes

### Free Aim
Default. Character attacks in direction of aim/facing. No lock. Full player control. Best for crowds, aerial attacks, environmental interactions.

### Soft Target
Target enemy highlighted. Attacks automatically track toward target within a threshold. Assists tracking; does not lock to a body region. Cycle targets with hold-and-release.

### Hard Target
Locked onto specific enemy. Attacks auto-track. Movement adjusts to circle-strafe around target. Reduces situational awareness of other threats.

### Body-Region Lock Point
Within any targeting mode: lock aim to specific body region of current target.
- Activation: Hold body-region aim input in Hard or Soft Target
- Effect: Attacks aimed at locked region; body-region targeting overlay appears
- Requirement: Clear line of sight to region; armor coverage visible in lock display
- Focus drain: Maintaining lock costs Focus; drops when Focus depleted

**Targeting Switch Rules:**
- Free Aim ↔ Soft Target: any time, no cost
- To/from Hard Target: deliberate input, no cost
- Body-Region Lock: requires Focus; drops automatically

---

## 10. Defense Mechanics

### Blocking
Block stance absorbs/deflects attacks from the covered arc. Absorbs Regional Structure damage to the blocking arm/shield region. Heavy attacks transfer stability damage through blocks. Sustained blocking drains Stamina. Directional — attacks from outside arc not blocked.

### Parry Quality Tiers
**VERIFIED: Tiers exist. Specific thresholds are PROPOSED.**

| Tier | Timing | Outcome |
|------|--------|---------|
| Failed Parry | Outside parry window | Partial damage; no parry benefit |
| Glancing Parry | Near window edge | Partial deflect; minor resource; attacker slows |
| Clean Parry | Within parry window | Full deflect; moderate resource; attacker in Recovery |
| Perfect Parry | Exact ideal frame | Full deflect + force; max resource; attacker staggered; riposte window |

Resource generation is class-specific: Edge Alignment (Edgebearer), Bounce (Gummy Brawler), Conviction (Syrupwarden).

### Dodge
**VERIFIED: Real displacement — not iframe-based invulnerability.**

Moves character to new physical position. If character is no longer at contact point when Step 4 runs, attack does not connect. Distance scales with Agility. Direction set by input at activation. A short dodge that doesn't clear the hitbox still results in contact — this is correct.

---

## 11. Reactions System

**Automatic Reactions:**
- Stagger animation on Stability zero
- Limb separation on Structure threshold breach
- Status effect visuals on status activation
- Balance adjustment on terrain changes

**Player-Triggered Reactions:**
- Riposte (after Perfect Parry — narrow window for counter-attack)
- Tech Roll (during Downed state — reduces recovery time)
- Limb Catch (on limb separation — input within range/time to grab own limb)

**Class Ability Reactions:**
- Gummy Brawler: Bounce builds automatically from impacts (Step 10)
- Edgebearer: Counter-Edge triggers on Clean/Perfect Parry
- Syrupwarden: Conviction builds from oath-aligned defensive actions

---

## 12. Camera Rules and Safety Zones

**Status: PROPOSED**

**Camera Design Principles:**
- Player character body never obscured during combat
- Body-region targeting overlay always visible when active
- Boss encounters: both player character and relevant boss region in frame
- Camera must not prevent reading incoming attack telegraphs

**Proposed Zones:**
- **Primary zone:** Player character always center ±30°
- **Target zone:** Current hard target in secondary zone
- **Safety zone:** Off-screen boss attacks telegraphed with audio + on-screen directional indicators

---

## 13. Accessibility

**Parry Assist (PROPOSED):** Extends parry window to input buffer maximum (120ms becomes full buffer, no quality degradation). Parry quality tiers collapse — Clean Parry is best achievable outcome. Perfect Parry not achievable with Parry Assist active.

**Combo Assist (PROPOSED):** Simplifies combo inputs to single-press sequences.

**Camera Options:** Sensitivity, distance, lock sensitivity, motion reduction (accessibility).

**Target Assist (PROPOSED):** Soft target more aggressive mode; Body-Region Lock reduced Focus drain option.

---

## 14. Example Combat Sequence — Text Walkthrough

**Status: PROPOSED — illustrative, not implementation-verified**

*Setup:* Bearkin Edgebearer (player) vs. Bronze Paw Guard (enemy) in the vertical slice arena.

1. Guard begins a Light Attack — Preparation animation visible.
2. Player inputs Parry — buffered (120ms).
3. Guard's Active window opens — player's parry input is within window → Clean Parry.
4. Attack energy zero (deflected). Player builds Edge Alignment. Guard enters Recovery.
5. Counter-Edge triggers (class ability) — player's next attack during Guard's Recovery builds double Edge Alignment.
6. Player inputs Heavy Attack (buffered from parry). Applies Body-Region Lock to Guard's weapon arm.
7. Heavy Attack goes Active — contact at Guard's left arm. Guard in Recovery — no defense.
8. Attack Energy = Base Force × Motion × Might × Counter-Edge Modifier. High value.
9. Armor Resolution: Light armor on Guard's arm → penetration result.
10. Regional Structure damage applied to Guard's left arm. Stability damage. Stagger threshold check.
11. If accumulated damage from prior hits brought the arm near threshold — separation event may trigger now.

---

## 15. Open Questions

| Question | Status |
|----------|--------|
| Perfect Parry ideal frame duration? | PROPOSED: 3–5 simulation frames |
| Block force transfer reduction? | PROPOSED: 60% |
| Can enemies use Body-Region Lock? | PROPOSED: Yes, at Elite rank and above |
| Free Aim critical hit bonus? | PROPOSED: Under consideration |

*Last updated: 2026-08-02*

related decisions.
