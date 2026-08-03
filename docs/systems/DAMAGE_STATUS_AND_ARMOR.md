# GUMFALL — Damage, Status Effects, and Armor
**Status:** VERIFIED (damage types, channels, armor categories, overmatch formula) / PROPOSED (specific numeric values)
**Cross-references:** [GelFlow Combat](GELFLOW_COMBAT.md) · [Body Integrity](BODY_INTEGRITY.md) · [Enchantments and Wards](ENCHANTMENTS_AND_WARDS.md) · [Lineages, Compositions, Flavors](../game-design/LINEAGES_COMPOSITIONS_FLAVORS.md)

---

## 1. Damage Channels

Every attack that connects distributes its resolved energy across four channels. The distribution depends on the damage type, armor outcome, and body region properties.

### Channel 1: Core Vitality

Direct reduction of the character's total Vitality pool. Most physical attacks contribute to Core Vitality; pure elemental attacks (very high flavor-intensity) may deal primarily to other channels.

**Rules:**
- Core Vitality damage happens even through some armor (absorption and force transfer outcomes)
- Core Vitality damage is reduced by Fortitude scaling
- When Core Vitality reaches zero, the character is incapacitated

---

### Channel 2: Regional Structure

Reduction of a specific body region's Local Structure. This channel is what drives limb separation and body region failure.

**Rules:**
- Regional Structure damage is applied to the specific region struck (Step 8 of GelFlow pipeline)
- Structure damage is not spread — a hit to the left arm only damages left arm Local Structure
- High Regional Structure damage with low Core Vitality damage is the pattern of precise, surgical attacks (Edgebearer, Pinshot)
- Regional Structure damage is reduced by armor in the struck region

---

### Channel 3: Stability

Reduction of the character's Stability stat for the current frame. If Stability reaches zero, the character is knocked down or staggered.

**Rules:**
- Stability damage is resolved per-hit (not accumulated like other channels — Stability resets between hits that don't immediately zero it, but accumulated hits on the same frame stack)
- Heavy attacks deal more Stability damage than light attacks
- Crush damage type has the highest Stability damage coefficient

---

### Channel 4: Status Buildup

Addition to the status effect accumulation counter for a relevant status. Buildup is type-specific — a Cherry Ember attack adds to Burning buildup; a Blue Frost attack adds to Freezing buildup.

**Rules:**
- Status buildup is per-region and per-type
- When buildup reaches the activation threshold, the status effect activates
- Buildup decays over time (different decay rates per status)
- Fortitude and status-specific resistances reduce buildup rate

---

## 2. Damage Types

All 9 damage types, their physical interpretation, and their interactions:

### Slice

**Physical interpretation:** A cutting action that separates gel along an edge. Attacks by bladed weapons.

**Primary channels:** Regional Structure (high), Core Vitality (moderate)
**Armor interaction:** Crystal-Set composition and heavy armor deflect Slice effectively. Flexible armor and Soft-Set gel are more vulnerable.
**Status buildup:** Wounding (persistent structural damage)
**Special:** Slice is the primary driver of Connection Strength damage at joints — precise Slice to a joint targets the connection.

---

### Pierce

**Physical interpretation:** A puncturing action that drives a point into gel. Spears, arrows, spikes.

**Primary channels:** Regional Structure (moderate), Status Buildup — Embedded Object (high)
**Armor interaction:** Heavy armor with thick material stops Pierce well. Crystal-Set composition deflects Pierce effectively. Soft-Set gel allows Pierce to penetrate without armor and embed.
**Status buildup:** Wounding, Embedded Object
**Special:** Pierce attacks have the highest chance of embedding the weapon or projectile in the target region.

---

### Crush

**Physical interpretation:** Compression and blunt force. Hammers, fists, boulders.

**Primary channels:** Core Vitality (moderate), Stability (high), Regional Structure (moderate)
**Armor interaction:** Force transfer through armor — heavy armor reduces Regional Structure damage but allows Stability damage to transfer. Crystal-Set composition takes shattering damage from Crush.
**Status buildup:** Stagger, Deformation
**Special:** Crush is the damage type that bypasses armor most reliably via force transfer. Crystal-Set lineages and compositions have a vulnerability here.

---

### Heat

**Physical interpretation:** Thermal energy application. Cherry Ember attacks, fire-based hazards, volcanic regions.

**Primary channels:** Core Vitality (moderate), Status Buildup — Burning (high), Temperature increase (region property)
**Armor interaction:** Metal-equivalent armor conducts heat (increases damage to body region after armor). Flexible organic armor insulates. Aerated composition vulnerable to bubble expansion.
**Status buildup:** Burning
**Special:** Heat damage interacts with Temperature property — sustained Heat raises regional temperature toward Melting threshold.

---

### Cold

**Physical interpretation:** Thermal energy removal. Blue Frost attacks, cold environments, cryo hazards.

**Primary channels:** Core Vitality (moderate), Status Buildup — Freezing (high), Temperature decrease, Crystallization increase
**Armor interaction:** Similar to Heat — conducting materials become barriers.
**Status buildup:** Freezing, Crystallizing
**Special:** Cold accelerates Crystallization. Crystal-Set compositions are vulnerable to Cold (shattering at extremes). Aerated compositions stiffen (Firm-Set effect temporarily).

---

### Sour

**Physical interpretation:** Chemical dissolution. Lime Sour attacks, Sourling cultural weapon treatments, environmental sour bogs.

**Primary channels:** Core Vitality (moderate), Regional Structure (moderate — corrosive), Status Buildup — Sourrot (high)
**Armor interaction:** Sour corrodes organic armor over time (reduces armor coverage). Metal-equivalent armor is partially resistant.
**Status buildup:** Sourrot
**Special:** Sour damage reduces armor coverage in the struck region over successive hits — armor becomes less effective against any damage type after Sour exposure.

---

### Sugar

**Physical interpretation:** Sweet crystallization/healing energy. Golden Sugar attacks, Sugar Well proximity hazards (for enemies), sacred weapon treatments.

**Primary channels:** Core Vitality (moderate), Status Buildup — Crystallizing (moderate — benign version), Healing for wielder (minor)
**Armor interaction:** Sugar damage is less common in standard combat — more relevant in specific encounter contexts. Armor generally resists it normally.
**Status buildup:** Crystallizing (benign form), potential Staleborn advancement (narrative context)
**Special:** Sugar damage to enemies with Golden Sugar vulnerability (specific monster types) does significantly enhanced damage.

---

### Shock

**Physical interpretation:** Kinetic electrical discharge. Cola Fizz and Lemon Spark attacks, electrical environmental hazards, specific Artificer devices.

**Primary channels:** Core Vitality (moderate), Stability (moderate), Status Buildup — Shocked (high)
**Armor interaction:** Metal-equivalent armor conducts Shock — force transfers through armor to the body with reduced loss. Organic/flexible armor insulates.
**Status buildup:** Shocked (temporary debuff: reduces next action's effectiveness)
**Special:** Wet environments (wet body regions, water/syrup pools) amplify Shock damage.

---

### Spirit

**Physical interpretation:** Spiritual/metaphysical force. Grape Shade attacks, Ward-breaking attacks, faith-based weapon treatments.

**Primary channels:** Core Vitality (high — Spirit bypasses physical armor partially), Status Buildup — Spirit Burned (high)
**Armor interaction:** Physical armor provides reduced protection against Spirit damage (PROPOSED: 50% of normal armor reduction). Wards are the primary defense against Spirit damage.
**Status buildup:** Spirit Burned (reduces Ward strength), Destabilized (reduces Conviction/Gel Reserve/Flavor Charges)
**Special:** Spirit damage is the primary counter to Ward defenses. High Spirit damage against active Wards creates Overmatch situations (see Section 7).

---

## 3. Armor Resolution — Detailed Rules

### Deflection

**When it occurs:** The attack's angle of impact and the armor's geometry cause the energy to be redirected. Highest probability with Slice attacks against curved armor surfaces; Slice vs. Crystal-Set composition.

**Outcome:**
- Attack energy: zero or near-zero damage to body region
- Force transfer: minor stability effect from glancing impact
- Attacker: weapon follow-through continues (not stopped)

**Counter:** Body-region targeting to exposed areas; Pierce or Crush rather than Slice against curved armor.

---

### Absorption

**When it occurs:** The armor material absorbs the attack's energy through deformation or material displacement.

**Outcome:**
- Attack energy: significantly reduced to body region
- Armor condition: degrades proportional to absorbed energy
- Force transfer: some Stability damage transfers through

**Counter:** Sustained attacks degrade armor faster than it can be repaired in combat. Armor penetration weapons or abilities.

---

### Penetration

**When it occurs:** The attack energy exceeds the armor's resistance at the impact point. Highest probability with Pierce attacks against rigid armor; heavy Slice against light armor.

**Outcome:**
- Attack energy: partially or fully reaches the body region
- Armor condition: degrades at penetration point (coverage reduction)
- Body region: takes Regional Structure damage

**Counter:** Higher-quality armor, better coverage, Ward protection.

---

### Force Transfer

**When it occurs:** The armor successfully stops the direct damage but the kinetic force transfers through the armor to the body beneath. Primary mechanic for Crush against heavy armor.

**Outcome:**
- Attack energy: Regional Structure damage minimal or zero
- Stability damage: significant (the body inside the armor was moved by the force)
- Special: heavy armor wearers are more susceptible to Crush via force transfer — the armor becomes a liability at extreme Crush forces

---

## 4. Armor Statistics

Each armor piece has the following statistics:

| Statistic | Description |
|-----------|-------------|
| Coverage | What percentage of the body region is protected (0–100%) |
| Cut Guard | Resistance to Slice damage in covered area |
| Pierce Guard | Resistance to Pierce damage in covered area |
| Crush Damping | Reduction of force transfer from Crush |
| Elemental Ward | Baseline elemental damage reduction (all types at same value) |
| Stability | Additional Stability contributed by this armor piece |
| Mass | Weight — affects Stamina drain, equipment load, movement |
| Articulation | How much the armor restricts movement speed and dodge |

---

## 5. Armor Categories

| Category | Cut Guard | Pierce Guard | Crush Damping | Elemental Ward | Mass | Articulation |
|----------|-----------|--------------|---------------|---------------|------|--------------|
| Flexible | Low | Low | Very Low | Moderate | Very Low | Excellent |
| Light | Moderate | Low | Low | Low-Moderate | Low | Good |
| Medium | Good | Moderate | Moderate | Low | Moderate | Moderate |
| Heavy | Very Good | Good | Good | Low | High | Poor |
| Shell | Excellent | Good | Low* | Very Low | Very High | Very Poor |

*Shell armor's low Crush Damping is its key weakness — the rigid shell transfers force directly.

**Design Rationale:** No armor category is purely best. Shell armor is the most protective against Slice but is especially vulnerable to Crush force transfer and greatly reduces mobility. Flexible armor maintains full mobility but provides minimal protection. The choice of armor is a genuine decision.

---

## 6. Status Effects — Complete List

### Wounding

**Description:** Persistent structural damage — the wound continues to drain Local Structure of the affected region.
**Buildup:** Slice damage
**Activation threshold:** PROPOSED: moderate Slice accumulation in one region
**Effect:** Small continuous Regional Structure drain on affected region
**Duration:** Until treated or Sugar Well
**Cure:** Confectioner Apothecandy, Gelomancer Mender, field bandaging (slows drain)
**PvP:** Diminishing returns on stacking multiple Wounding effects on one region

---

### Bleeding

**Description:** Vitality drain — the character is losing gel substance from a wound that extends beyond just structural damage.
**Buildup:** High Slice damage combined with Pierce
**Effect:** Continuous Core Vitality drain
**Duration:** Fixed duration (PROPOSED: 15–30 seconds game time), reduced by Fortitude
**Cure:** Confectioner, Gelomancer, consumables
**PvP:** Stacks multiply (two Bleeding sources add)

---

### Burning

**Description:** Heat damage over time — the region is actively on fire.
**Buildup:** Heat damage
**Effect:** Continuous Heat damage to the burning region; Temperature property continues to rise
**Duration:** Fixed, reduced by cold application
**Cure:** Cold water/syrup immersion, Blue Frost ability, consumable (Cold Gel)
**Special:** Burning region's armor takes condition damage from internal heat

---

### Freezing

**Description:** Region is icing over — movement in the frozen region becomes restricted.
**Buildup:** Cold damage
**Effect:** Reduced Elasticity in affected region; increasing Crystallization; movement restriction for leg regions
**Duration:** PROPOSED: 10–20 seconds; reduced by heat application
**Cure:** Heat application, Cherry Ember ability, movement (physical activity slightly warms)
**Threshold:** At max Freezing, region is Frozen (status lock — see below)

---

### Frozen (Status Lock)

**Description:** The region is completely frozen. If the region is a limb, it cannot be used until thawed.
**Entry:** Freezing status reaches maximum buildup
**Effect:** Region cannot be controlled by player; Vulnerability to Crush (shattering)
**Duration:** Until heat is applied (active cure required)
**Cure:** Sustained Heat damage to region, Cherry Ember ability, consumable

---

### Sourrot

**Description:** Sour chemical is eating through the body region's gel structure.
**Buildup:** Sour damage
**Effect:** Continuous Regional Structure drain; reduces Elasticity; armor in the region begins corroding (coverage reduction over time)
**Duration:** Fixed, decay
**Cure:** Confectioner neutralizer, Golden Sugar application, Sugar Well
**Special:** Sourrot reduces armor coverage over time — multiple Sourrot applications can strip armor coverage from a region entirely during a long fight

---

### Crystallizing

**Description:** The region's gel is taking on Crystal-Set properties beyond the character's natural composition.
**Buildup:** Cold damage, Sugar damage
**Effect:** Crystallization property rises in affected region; natural armor effect begins at high values; brittleness risk at very high values
**Duration:** Slow decay; warm environments help
**Cure:** Heat, Gelomancer Destabilize, Sugar Well
**Note:** A controlled amount of Crystallizing can be beneficial (increased natural armor); the dangerous threshold is Brittleness

---

### Melting

**Description:** The region's gel is liquefying from extreme heat.
**Buildup:** Heat damage beyond Burning threshold; environmental extreme heat
**Effect:** Elasticity reduced (melted gel doesn't spring back); Local Structure drain; deformation becomes permanent faster
**Duration:** Continues while temperature remains elevated
**Cure:** Cooling the region, Sugar Well
**Special:** Severe Melting can cause the region to lose physical volume permanently (Sugar Well required to restore)

---

### Pinned

**Description:** A limb is physically attached to a surface or another body by an embedded object.
**Cause:** Pin attacks (Pinshot Wallpin specialty), Harpooner attacks, large embedded objects
**Effect:** The pinned limb cannot be moved. Character must use Stamina to attempt to pull free, or have an ally extract the pin.
**Duration:** Until extracted or Stamina-forced extraction
**Cure:** Extraction action (own or ally), Gelomancer Gel Pull, Confectioner
**PvP:** The most powerful single-limb control status; specific Diminishing Returns rules apply (see Section 8)

---

### Disarmed

**Description:** The character's weapon has been knocked from their grip or destroyed.
**Cause:** Specific weapon-targeting attacks, Cutpurse ability, weapon destruction
**Effect:** Primary weapon not in hand; must retrieve (pick up) or switch to secondary
**Duration:** Until weapon retrieved or switched
**Cure:** Pick up dropped weapon (action), switch to secondary weapon

---

### Silenced

**Description:** The character cannot use ability-based actions.
**Cause:** Discordant specialty abilities, specific monster abilities
**Effect:** No class abilities available; standard attacks only
**Duration:** Fixed (PROPOSED: 5–10 seconds game time)
**Cure:** Duration, some consumables
**PvP:** Strong counter to ability-dependent classes; Diminishing Returns apply

---

### Staggered

**Description:** The character is momentarily disrupted — cannot take actions during stagger animation.
**Cause:** Stability reaching zero from single hit or sustained hits
**Effect:** Stagger animation plays; character is vulnerable during this window
**Duration:** Stagger animation duration (varies by attack type)
**Cure:** Tech Roll reaction reduces recovery time
**PvP:** Stagger chaining is subject to Diminishing Returns (cannot chain stagger indefinitely)

---

### Shocked

**Description:** Kinetic-electric discharge has disrupted the character's body.
**Buildup:** Shock damage
**Effect:** Next action costs additional Stamina; brief coordination disruption
**Duration:** Next action consumed the penalty; then clears
**Cure:** Single action clears it
**Special:** Wet environments increase Shocked severity

---

## 7. Status Buildup and Threshold System

### Buildup Mechanics

Status buildup accumulates per region per status type. The buildup counter:
- Increases with each hit of the relevant damage type
- Decays over time (different rates per status)
- Triggers the status when it reaches the activation threshold

### Fortitude and Resistance

Fortitude reduces all status buildup rates (PROPOSED: 2% reduction per Fortitude point above baseline).

Composition and flavor affinity resistances reduce buildup for specific types:
- Sourlings: Sour buildup reduced 20%
- Cherry Ember affinity: Burning buildup reduced 20%; Freezing buildup increased 10%
- Crystal-Set: Crystallizing buildup accelerated (they are closer to the threshold); Freezing buildup reduced

### Buildup Persistence

Buildup does not reset between encounters unless the character visits a Sugar Well. This means:
- A character who took significant Burning buildup in the previous encounter is closer to Burning activation in the next
- Strategic use of Sugar Wells between encounters matters

---

## 8. Diminishing Returns in PvP

**Status: PROPOSED baseline values**

In PvP contexts, the following Diminishing Returns apply to prevent control-status lock:

| Status | First Application | Second | Third | Fourth+ |
|--------|------------------|--------|-------|---------|
| Pinned | Full duration | 75% | 50% | 25% (cap) |
| Frozen | Full duration | 65% | 40% | Immune window |
| Staggered | Full duration | 80% | 60% | 40% cap |
| Silenced | Full duration | 60% | 40% | Immune window |

Diminishing Returns reset after a window (PROPOSED: 15 seconds) without the relevant status application.

Hard control status effects (Pinned, Frozen) have an absolute immunity window: after sufficient applications, the target becomes temporarily immune to that status entirely.

---

## 9. Overmatch Formula

When an attack carries enchantment pressure against a target with Ward protection, the Overmatch calculation determines the effective damage:

**Formula (VERIFIED):**
`Overmatch = Enchantment Pressure − Ward Strength`

If Overmatch > 0: The ward is breached; damage proceeds at full enchantment effect plus Overmatch as a bonus multiplier.

If Overmatch ≤ 0: The ward holds; enchantment effect is blocked or significantly reduced.

**Overmatch Band Table (PROPOSED):**

| Overmatch Value | Effect |
|----------------|--------|
| ≤ 0 | Ward holds; full enchantment block |
| 1–10 | Ward stressed; enchantment effect at 25% |
| 11–25 | Ward cracked; enchantment effect at 50% |
| 26–50 | Ward broken; enchantment effect at 75%; Ward condition reduced |
| 51–100 | Ward shattered; full enchantment effect; Ward destroyed |
| 100+ | Catastrophic overmatch; full effect + bonus to body region damage |

---

## 10. Ward System Overview

Wards are protective effects that absorb incoming damage (especially Spirit damage and enchantment effects).

**Ward Types (preliminary — full detail in [Enchantments and Wards](ENCHANTMENTS_AND_WARDS.md)):**
- Vitality Ward: Absorbs incoming Core Vitality damage
- Structure Ward: Absorbs incoming Regional Structure damage to specific region
- Elemental Ward: Reduces elemental damage type (one type per Ward)
- Spirit Ward: Counters Spirit damage and enchantment effects
- Stability Ward: Contributes to Stability against knockback

**Ward Interactions with Damage:**
- Physical damage (Slice, Pierce, Crush) is partially countered by Structure/Vitality Wards
- Elemental damage is fully countered by matching Elemental Ward
- Spirit damage is countered by Spirit Ward but can overmatch it
- Ward strength is the primary defense against enchantment effects

*Last updated: 2026-08-02*
