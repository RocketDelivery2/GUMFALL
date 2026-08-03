# GUMFALL — Attributes and Derived Stats
**Status:** VERIFIED (attribute names and general descriptions) / PROPOSED (specific formulas, scaling values, threshold numbers)
**Cross-references:** [Character Creation](CHARACTER_CREATION.md) · [Classes and Specialties](CLASSES_AND_SPECIALTIES.md) · [GelFlow Combat](../systems/GELFLOW_COMBAT.md) · [Body Integrity](../systems/BODY_INTEGRITY.md)

---

## 1. Overview

GUMFALL uses six Primary Attributes and six Derived Statistics. Primary Attributes represent the fundamental capabilities of a character; Derived Statistics are calculated from them and track the resources and resistances that govern gameplay moment-to-moment.

**Design Principle:** Attributes are not damage numbers. They are character properties that influence systems. A high Might character is not simply "deals more damage" — they are physically more forceful in ways that affect grapples, knockback, equipment requirements, and environmental interactions, as well as melee damage.

---

## 2. Primary Attributes

### 2.1 Might

**Description:** Physical mass application and force generation. Might represents how effectively a character's gel mass translates into mechanical force — hitting harder, pushing more, carrying more.

**Systems Affected:**
- Melee attack energy (direct multiplier)
- Grapple initiation and break strength
- Carrying capacity (equipment weight limits)
- Knockback force applied to targets
- Knockback resistance (partially)
- Limb-grip strength during reattachment under combat pressure
- Environmental interactions: moving heavy objects, forcing doors

**Scaling Behavior:** Linear contribution to melee attack energy calculation. Diminishing returns in pure knockback resistance (Fortitude is the primary resistance stat).

**Combat Applications:**
- Light attacks scale with Might
- Heavy attacks scale with Might significantly
- Grapple checks use Might directly
- Weapon mass limits: heavy weapons require minimum Might to wield without penalty

**Non-Combat Applications:**
- Breaking siege structures
- Moving environmental obstacles
- Crafting: heavy weapon construction
- Arena: grapple-based modes

**Interaction with Lineage:** Bearkin and Marshfolk have Might tendency. Jawbreaker Kin have structural Might equivalent (their shell absorbs force rather than generating it).

**Interaction with Composition:**
- Firm-Set: Might slightly more effective per point
- Aerated: Might less effective per point (lower density)
- Syrup-Core: Might from impact is higher but self-Might (grip, carry) is lower

---

### 2.2 Agility

**Description:** Speed of movement and precision of positioning. Agility represents both raw speed and the control precision to place that speed effectively.

**Systems Affected:**
- Dodge distance and recovery time
- Attack startup reduction (not damage — the window that opens)
- Ranged accuracy at distance
- Stamina cost of movement actions
- Weapon recovery time (Agility reduces recovery window slightly)
- Stealth movement efficiency
- Dual-weapon / multi-weapon handling

**Scaling Behavior:** Agility has meaningful contribution across the full level range with no hard cap. Returns are not diminishing for speed but are diminishing for ranged accuracy beyond certain thresholds.

**Combat Applications:**
- Dodge distance scales with Agility
- Ranged attack accuracy scales with Agility
- Attack speed (not damage) influenced by Agility
- Parry window marginally extended by Agility (PROPOSED: very small extension, not the primary parry stat)

**Non-Combat Applications:**
- Climbing and traversal speed
- Stealth operations
- Crafting: precision tasks (e.g., enchantment inscription)
- Arena: speed-based modes

**Interaction with Lineage:** Jellybean Folk, Wormkin, Swarmkin have Agility tendency. Jawbreaker Kin have lowest Agility tendency.

**Interaction with Composition:** Aerated composition amplifies Agility (lighter). Crystal-Set composition reduces base Agility slightly (stiffer).

---

### 2.3 Fortitude

**Description:** Structural resilience and endurance. Fortitude represents how well a character's gel maintains its integrity under physical and elemental stress.

**Systems Affected:**
- Body integrity maintenance rate (how fast regions recover passively)
- Status effect resistance and duration reduction
- Knockback resistance
- Temperature resistance (heat and cold damage thresholds)
- Stamina pool size (partial)
- Limb separation threshold (higher Fortitude = more force required to separate)
- Recovery time from stagger

**Scaling Behavior:** Fortitude provides consistent value at all levels. At very high levels, Fortitude begins to provide diminishing returns on status duration reduction (to prevent immunity).

**Combat Applications:**
- Threshold for limb separation under attack
- Stagger duration reduction
- Status resistance (partial — see also Spirit for magical statuses)
- Vitality pool (partial contribution — see Derived Stats)

**Non-Combat Applications:**
- Endurance across long travel
- Resistance to environmental hazards (extreme heat, cold regions)
- Survival in hostile environments without shelter
- Crafting: working with hazardous materials

**Interaction with Lineage:** Bearkin, Gumdrop Folk, Sourlings, Marshfolk have Fortitude tendency. Jellybean Folk have lowest Fortitude tendency.

**Interaction with Composition:**
- Crystal-Set: High structural Fortitude, but cold/crush can cause catastrophic fracture
- Layered: Outer-layer Fortitude different from inner Fortitude
- Soft-Set: Lower structural Fortitude, but deformation reduces damage (gel absorbs)

---

### 2.4 Technique

**Description:** Precision, craft, and learned mechanical skill. Technique represents the efficiency of a character's trained actions — hitting where intended, crafting at a higher quality, and managing complex ability sequences.

**Systems Affected:**
- Weapon mastery advancement rate
- Crafting quality tier (determines maximum achievable craftsmanship)
- Critical hit probability (precision placement)
- Parry quality tier improvement
- Multi-step ability sequences (cancel timing windows expanded)
- Body-region targeting accuracy
- Repair efficiency

**Scaling Behavior:** Technique provides increasing returns on weapon mastery advancement (the more Technique, the faster techniques unlock). Crafting quality plateaus are Technique-gated.

**Combat Applications:**
- Precision of body-region targeting
- Critical hit rate
- Parry quality (Technique + Agility both contribute)
- Cancel window timing

**Non-Combat Applications:**
- Crafting: quality cap
- Item repair: efficiency and material recovery
- Lockpicking and mechanism operation
- Enchantment inscription precision

**Interaction with Lineage:** Wormkin, Jellybean Folk, Licoricefolk, Bottleborn have Technique tendency.

**Interaction with Composition:** Crystal-Set Technique is slightly more precise (harder surface, more predictable) but less forgiving of error.

---

### 2.5 Intellect

**Description:** Learning speed, analytical capability, and breadth of applicable knowledge. Intellect represents how quickly a character acquires understanding of new systems and how much of that understanding they can hold simultaneously.

**Systems Affected:**
- Class ability learning rate
- Lore and Monster Knowledge acquisition
- Crafting recipe diversity (how many recipe categories are accessible)
- Gelomancy casting complexity (for Gelomancer class)
- Warding comprehension (Ward categories accessible)
- NPC dialogue options (knowledge-based choices)
- Item identification speed and depth

**Scaling Behavior:** Intellect provides consistent value in crafting and knowledge systems. In combat, Intellect's contribution is indirect (faster ability learning, not direct damage). Diminishing returns on knowledge acquisition at very high values.

**Combat Applications:**
- Ability unlock rate
- Access to complex multi-stage abilities
- Ward placement comprehension
- Tactician abilities (for relevant classes)

**Non-Combat Applications:**
- Monster Knowledge (faster entries, more detail)
- Recipe discovery
- Lore access
- Dialogue options

**Interaction with Lineage:** Jellybean Folk, Licoricefolk, Bottleborn, Wormkin have Intellect tendency.

**Interaction with Composition:** No strong composition-Intellect interaction. Clear Neutral flavor affinity has a mild Intellect resonance.

---

### 2.6 Spirit

**Description:** Spiritual presence, elemental connection, and conviction force. Spirit represents the character's attunement to the world's fundamental energies — the Sugar Lattice's residual power, flavor affinities, and the metaphysical forces that govern Wardcrafting and Conviction-based abilities.

**Systems Affected:**
- Gel Reserve pool (Gelomancer class)
- Flavor Charges (Flavorweaver class)
- Conviction resource (Syrupwarden class)
- Ward strength (all Wards)
- Spiritual status effects (resistance and application)
- Elemental damage bonus from flavor affinity
- Companion bond resonance (story system)

**Scaling Behavior:** Spirit scales linearly for resource pools and Ward strength. Elemental damage contribution from Spirit diminishes at very high values (flavor affinity has its own cap). Spirit resistance to status effects is consistent.

**Combat Applications:**
- Ward placement and strength
- Elemental ability damage
- Spiritual status application (Spirit attacks vs. Spirit resistance)
- Conviction for Syrupwarden

**Non-Combat Applications:**
- Environmental spiritual hazards
- Temple interactions
- Relic identification
- Companion relationship bonus (Spirit contributes to social perceptiveness)

**Interaction with Lineage:** Drakegums, Gumdrop Folk, Ringborn, Swarmkin have Spirit tendency.

**Interaction with Composition:**
- Syrup-Core: Higher Spirit flow (the fluid interior conducts spiritual energy)
- Crystal-Set: Spirit energy conducted differently — more precise but less fluid

---

## 3. Derived Statistics

### 3.1 Vitality

**What it is:** The overall life pool of the character. Vitality represents total gel-body integrity across all regions — a composite measure that reaches zero when the character is incapacitated.

**Formula (PROPOSED):** `Vitality = (Fortitude × 10) + (Might × 5) + (Level × 8) + Base`
Base value: PROPOSED 50 at Level 1.

**What Drains Vitality:**
- Core Vitality damage from attacks that penetrate Regional Structure
- Status effects with Vitality drain components
- Environmental hazard exposure

**What Restores Vitality:**
- Sugar Wells (full restoration)
- Healing abilities (Gelomancer Mender, Confectioner Apothecandy)
- Consumables
- Natural recovery (very slow, combat-disabled)

**Crisis States:**
- Below 50%: minor passive debuffs begin (PROPOSED: -5% movement speed)
- Below 25%: Danger State — significant debuffs, companion dialogue triggers
- 0: Incapacitated — not dead, but requires revival or Sugar Well

**Note:** Vitality is NOT the same as body integrity. It is a summary statistic. Individual regional loss can incapacitate a character even if total Vitality is not at zero (head loss, torso critical damage).

---

### 3.2 Structure

**What it is:** The collective structural integrity of the character's body regions. Structure is not a single pool — it is the sum of all Regional Structure values. Total Structure loss does not necessarily indicate incapacitation, but critical regional Structure loss does.

**Formula (PROPOSED):** Structure is tracked per-region, not as a single number. See [Body Integrity](../systems/BODY_INTEGRITY.md) for per-region tracking rules.

**What Drains Structure:**
- Regional Structure damage from attacks
- Environmental damage (crystallization, melting, sour rot)
- Status effects targeting structure

**What Restores Structure:**
- Sugar Wells (full per-region restoration)
- Reattachment (restores the attached limb's structure to its separated state)
- Mender abilities (partial restoration)
- Field bandaging (slows drain, minor restoration)

**Crisis States:** Per-region — when a region reaches Structure threshold, it triggers limb separation, deformation, or incapacitation depending on region type.

---

### 3.3 Stamina

**What it is:** The energy pool for physical actions. Stamina depletes with heavy movement, dodging, blocking, and sustained combat. Stamina zero does not prevent action but significantly degrades performance.

**Formula (PROPOSED):** `Stamina = (Fortitude × 8) + (Might × 3) + (Level × 5) + Base`
Base: PROPOSED 40 at Level 1.

**What Drains Stamina:**
- Dodge actions (significant drain)
- Heavy attacks (significant drain)
- Running (slow drain)
- Blocking sustained attacks
- Some class abilities

**What Restores Stamina:**
- Standing still (fastest recovery)
- Light movement (moderate recovery)
- Specific consumables
- Class abilities (some Syrupwarden abilities restore party Stamina)

**Crisis States:**
- Below 25%: Actions become sluggish (PROPOSED: reduced speed)
- 0: Exhaustion — dodge range halved, attack recovery extended

---

### 3.4 Focus

**What it is:** The precision and mental energy pool. Focus determines quality of aimed actions (ranged attacks, body-region targeting, crafting) and depletes under stress.

**Formula (PROPOSED):** `Focus = (Intellect × 6) + (Technique × 4) + (Level × 3) + Base`
Base: PROPOSED 30 at Level 1.

**What Drains Focus:**
- Sustained targeting (body-region lock)
- Crafting complex items
- Using Intellect-gated abilities
- Combat noise and disruption (environment affects Focus)

**What Restores Focus:**
- Moments of stillness
- Specific consumables (Focus restoratives)
- Meditation (camp mechanic — PROPOSED)
- Some Flavorweaver abilities

**Crisis States:**
- Below 25%: Aimed abilities lose precision (targeting wobble, PROPOSED)
- 0: Focus exhaustion — body-region targeting disabled until restored

---

### 3.5 Adhesion

**What it is:** The capacity to bond — to surfaces, to reattached limbs, and to other characters (grapple, bind, cooperative moves).

**Formula (PROPOSED):** `Adhesion = (Spirit × 4) + (Agility × 2) + (Fortitude × 2) + Composition Modifier`
Composition modifier: Soft-Set +5, Syrup-Core +8, Crystal-Set -3, Firm-Set +2, Aerated 0, Layered +1.

**What Drains Adhesion:**
- Cold environments (reduces stickiness)
- Anti-adhesion status effects (Crystallizing)
- Time since last contact with Sugar Lattice node

**What Restores Adhesion:**
- Warm environments
- Sugar Lattice proximity
- Specific consumables
- Peach Bloom flavor affinity resonance

**Applications:**
- Reattachment bonding time: higher Adhesion = faster reattachment
- Climbing adhesive surfaces
- Grapple effectiveness
- Bind duration (Licorice Rogue abilities)
- Environmental traversal (sticky terrain benefits)

**Crisis States:**
- Below 25%: Reattachment takes twice as long
- 0: Reattachment impossible in the field — Sugar Well required

---

### 3.6 Stability

**What it is:** Resistance to being knocked down, staggered, or displaced by physical impacts.

**Formula (PROPOSED):** `Stability = (Fortitude × 5) + (Might × 3) + (Level × 2) + Composition Modifier`
Composition modifier: Crystal-Set +5, Firm-Set +3, Jawbreaker Kin bonus +5, Aerated -3.

**What Drains Stability:**
- Heavy impacts
- Knockback attacks
- Specific status effects (Staggered, Disoriented)
- Extreme temperature shifts

**What Restores Stability:**
- Lower ground position
- Specific stances (some class abilities)
- Recovery between encounters

**Thresholds:**
- At 0 Stability in a given hit: Character is knocked down (stagger animation plays)
- Sustained 0 Stability: Vulnerable state — reduced defense

---

## 4. Attribute Growth

**Status: PROPOSED — exact values require verification against level design**

### Base Growth

- Characters gain Attribute Growth Points (AGP) at specific levels.
- PROPOSED baseline: +1 AGP per 10 levels (Levels 10, 20, 30, 40, 50, 60, 70, 80, 90, 100 = 10 AGP total).
- Additional AGP from: class features (some classes grant AGP at specific levels), background completions, and hidden achievement milestones.

### AGP Spending

- 1 AGP raises one primary attribute by 1 point.
- No attribute cap above creation maximum (attributes can grow indefinitely with AGP, within equipment and ability prerequisites).
- Players choose which attribute to raise — no forced growth path.

### Attribute Growth Points — Award Schedule

| Level | AGP Awarded | Source |
|-------|------------|--------|
| 10 | 1 | Level milestone |
| 20 | 1 | Level milestone |
| 25 | 1 | Adventurer era milestone |
| 30 | 1 | Level milestone |
| 40 | 1 | Level milestone |
| 50 | 2 | Level milestone + Veteran era |
| 60 | 1 | Level milestone |
| 70 | 1 | Level milestone |
| 71-80 | PROPOSED +2 total in this band | Legendary era |
| 80 | 1 | Level milestone |
| 81-90 | PROPOSED +2 total in this band | Mythic era |
| 100 | 2 | Transcendent milestone |

*Note: Above values are PROPOSED. Exact AGP schedule to be finalized during progression design.*

---

## 5. Example Values at Key Level Milestones

**Status: PROPOSED — calculated from proposed formulas above. NOT VERIFIED.**

The following table shows PROPOSED attribute and derived stat examples for a Bearkin Gummy Brawler (Firm-Set, Cherry Ember) with investment in Might and Fortitude:

| Level | Might | Fortitude | Vitality | Structure (avg/region) | Stamina | Stability |
|-------|-------|-----------|---------|----------------------|---------|---------|
| 1 | 3 | 3 | 95 | 30 | 69 | 30 |
| 5 | 3 | 3 | 95 | 30 | 69 | 30 |
| 10 | 4 | 3 | 112 | 35 | 77 | 35 |
| 20 | 5 | 4 | 138 | 45 | 90 | 43 |
| 30 | 6 | 5 | 168 | 55 | 105 | 53 |
| 50 | 8 | 7 | 234 | 75 | 133 | 71 |
| 70 | 10 | 9 | 306 | 95 | 165 | 93 |
| 100 | 13 | 12 | 418 | 130 | 221 | 126 |

*These are illustrative PROPOSED values. Do not use for balancing until verified against implemented formulas.*

---

## 6. Attribute Interactions with Lineage, Composition, and Flavor

| Factor | Primary Effect | Attribute Interaction |
|--------|---------------|----------------------|
| Bearkin lineage | Might tendency | +1 effective Might (first 10 levels) |
| Firm-Set composition | Higher structure | Fortitude thresholds raised by flat value |
| Crystal-Set composition | Hard exterior | Stability bonus; Agility mild reduction |
| Aerated composition | Low density | Agility bonus; Might reduction in carry/grip |
| Cherry Ember flavor | Heat generation | Spirit used for heat damage; Heat resistance |
| Blue Frost flavor | Cold generation | Spirit used for cold damage; brittleness in Agility |
| Clear Neutral | No affinity | Small bonus to all derived stats |
| Peach Bloom | Adhesive | Adhesion derived stat bonus |
| Cola Fizz | Volatile | Shock damage; Stamina slightly faster drain but faster recovery |

---

## 7. Design Notes

- **Attributes are multidimensional.** No attribute should be purely offensive or purely defensive. This discourages attribute dump builds that work in many games.
- **Derived stat crisis states create visible dramatic moments.** When Stamina hits zero, it should feel like exhaustion looks in combat. When Adhesion fails, reattachment fails under fire. These are designed to be dramatic, not frustrating.
- **Lineage tendencies are not locks.** A Jawbreaker Kin can invest in Agility and be meaningfully fast. The tendency just means they start further from the peak of that stat and their physical form works slightly against them — which is accurate and interesting, not a trap.

*Last updated: 2026-08-02*
