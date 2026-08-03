# GUMFALL — Weapons, Mastery, and Equipment
**Status:** VERIFIED (weapon families, craftsmanship tiers, armor categories) / PROPOSED (specific stat values, material band values)
**Cross-references:** [Damage, Status, and Armor](DAMAGE_STATUS_AND_ARMOR.md) · [Classes and Specialties](../game-design/CLASSES_AND_SPECIALTIES.md) · [Crafting, Economy, and Loot](CRAFTING_ECONOMY_AND_LOOT.md) · [Enchantments and Wards](ENCHANTMENTS_AND_WARDS.md)

---

## 1. Weapon Families

### Swords
**Description:** Single-edge or double-edge bladed weapons of medium length. Primary damage type: Slice. Secondary: Pierce (thrust).
**Class Associations:** Edgebearer (primary), Licorice Rogue (short swords), Syrupwarden
**Mastery Focus:** Edge Geometry, Thrust Precision, Parry Response

---

### Axes
**Description:** Single or double-headed bladed weapons with a weighted head. High Slice damage; significant Crush component from the weight.
**Primary Damage:** Slice (primary), Crush (secondary from momentum)
**Class Associations:** Crusher (axe variants), Edgebearer (cleaver specialty)
**Mastery Focus:** Impact Trajectory, Overhead Arc, Leverage Points

---

### Spears and Polearms
**Description:** Reach weapons — long shafts with pointed or bladed tips. Pierce primary; Slice secondary on some variants.
**Primary Damage:** Pierce (primary), Slice (for bladed polearms)
**Class Associations:** Skewer (primary)
**Mastery Focus:** Thrust Timing, Distance Management, Sweep Technique

---

### Hammers
**Description:** Blunt impact weapons with weighted heads. Crush primary; Stability-damage focused.
**Primary Damage:** Crush (primary)
**Class Associations:** Crusher (primary)
**Mastery Focus:** Momentum Generation, Impact Placement, Force Transfer Maximization

---

### Daggers
**Description:** Short bladed weapons optimized for close range and precision. Slice and Pierce; low Base Force but high precision multipliers.
**Primary Damage:** Slice, Pierce
**Class Associations:** Licorice Rogue (primary), Edgebearer (secondary)
**Mastery Focus:** Vulnerable Point Targeting, Quick Strike Sequences, Off-Hand Techniques

---

### Bows
**Description:** Drawn-string ranged weapons. Pierce primary. Accuracy scales with Agility; Base Force scales with Might (draw strength).
**Primary Damage:** Pierce
**Class Associations:** Pinshot (primary)
**Mastery Focus:** Draw Timing, Wind Read, Arrow Management

---

### Crossbows
**Description:** Mechanically-assisted ranged weapons. Higher Base Force than bows; slower reload; Pierce primary.
**Primary Damage:** Pierce
**Class Associations:** Pinshot (secondary option), Candy Artificer (heavy crossbow variants)
**Mastery Focus:** Reload Efficiency, Precision Aim, Bolt Selection

---

### Shields
**Description:** Defensive implements — blocking tools rather than weapons. Contribute to block coverage and block quality. Some shields have offensive applications (bashes, rim strikes).
**Primary Use:** Defense (block coverage, Stability contribution)
**Class Associations:** Edgebearer (Sugarsteel Knight), Skewer (Formation Guard), Syrupwarden, Crusher (Shieldmaul)
**Mastery Focus:** Block Coverage Optimization, Shield Bash Timing, Ward Application

---

### Unarmed Implements
**Description:** Gloves, gauntlets, and arm reinforcements that enhance unarmed combat. No explicit weapon; the character's own body is the weapon.
**Primary Damage:** Crush (primary), Slice (spiked variants)
**Class Associations:** Gummy Brawler (primary)
**Mastery Focus:** Impact Angles, Bounce Optimization, Grapple Techniques

---

### Magical Focuses
**Description:** Objects that channel elemental energy — wands, staves, ritual implements. Do not deal physical damage directly; they amplify ability-based damage.
**Primary Damage:** By flavor affinity (Heat, Cold, Sour, etc.) — ability-dependent
**Class Associations:** Flavorweaver (primary), Gelomancer (secondary), Syrupwarden (ritual focus)
**Mastery Focus:** Charge Efficiency, Affinity Resonance, Elemental Blending

---

### Artificer Devices
**Description:** Mechanical combat tools — deployed devices, mounted weapons, handheld mechanisms. Range from turret-deploy mechanisms to personal projectile launchers.
**Primary Damage:** Variable (device-dependent: Crush, Pierce, Shock, Fire)
**Class Associations:** Candy Artificer (primary)
**Mastery Focus:** Deployment Speed, Device Coordination, Overclock Management

---

## 2. Weapon Statistics

| Statistic | Description |
|-----------|-------------|
| Base Force | The weapon's intrinsic force contribution to Attack Energy calculation |
| Reach | The distance at which the weapon can make contact |
| Recovery | The weapon's Recovery phase duration (longer = more risk after attack) |
| Weight | Contributes to equipment load; affects Stamina use and Might requirement |
| Primary Damage Type | The damage type the weapon primarily deals |
| Secondary Damage Type | Secondary damage type (if applicable) |
| Material | The material determines the weapon's interaction with target compositions |
| Craftsmanship | Quality tier (see Section 5) |

---

## 3. Material Bands

**Status: PROPOSED — exact level ranges TBD by economy design**

Materials determine the baseline stats a weapon can achieve and which enemies they're effective against. Ten material bands:

| Band | Example Materials | Approximate Level Range | Notes |
|------|------------------|------------------------|-------|
| 1 — Crude | Raw licorice, soft gel wood, untempered sugar | Levels 1–5 | Starter materials; widely available |
| 2 — Common | Worked sugar crystal, cured licorice, standard gel-cast | Levels 5–15 | Common trade goods |
| 3 — Treated | Hardened syrup alloy, reinforced crystal, sour-tempered gel | Levels 15–25 | Requires basic smithing |
| 4 — Refined | Crystallite (refined crystal), heat-drawn licorice cord, layer-bound sugar | Levels 25–35 | Artisan-level production |
| 5 — Tempered | Tempered crystallite, cold-forged licorice steel, compressed syrup-core | Levels 35–45 | Mastercraft level; dedicated facilities needed |
| 6 — Alloy | Sugar-crystal alloy, licorice composite, flavor-infused gel metals | Levels 45–55 | Alloying process required |
| 7 — Elite | Shard-steel (crystalline razor-edge), hard-crack (extreme compression material) | Levels 55–65 | Elite craftsmen only |
| 8 — Champion | Lattice-steel (Lattice fragment reforged), Void-licorice (Wrapperborn process) | Levels 65–75 | Champion-tier; specific origins |
| 9 — Relic | Pre-Shattering masterworks, ancient Lattice-forged | Levels 75–90 | Found, not crafted; provenance matters |
| 10 — Mythic | World-origin materials, Transcendent-era craftwork | Levels 90–100 | Essentially unique |

---

## 4. Weapon Mastery System

### Overview

Weapon Mastery tracks how skilled a character is with a specific weapon type. Mastery is not a stat — it is a separate progression track per weapon family.

**How it works:**
- Using a weapon in combat accumulates Mastery experience for that weapon family
- Mastery experience rate is modified by Technique (higher Technique = faster Mastery accumulation)
- At each Mastery level threshold, a new technique is unlocked for that weapon family

### Mastery Levels and Technique Unlocks

**Status: PROPOSED — specific unlock thresholds TBD**

| Mastery Level | Unlock Type | Example |
|--------------|-------------|---------|
| 1 (Novice) | Baseline technique | Standard attack animation |
| 2 (Familiar) | Combo extension | A second-hit follow-up option |
| 3 (Practiced) | Defensive technique | A counter-attack variant |
| 4 (Skilled) | Special technique | A body-region targeting move |
| 5 (Expert) | Advanced technique | A high-commitment powerful attack |
| 6 (Master) | Mastery Discipline | Access to a Mastery Discipline path |

**Mastery Disciplines** are specialized technique trees beyond the base mastery progression. Each weapon family has 2–3 Mastery Disciplines — distinct high-level specializations.

**Example (Sword Mastery Disciplines):**
- The Edge Path: Optimization for Edge Alignment generation; parry-centric techniques
- The Point Path: Thrust and Pierce techniques; body-region precision
- The Weight Path: Heavy sword techniques; Momentum and Crush integration

### Mastery Persistence

Weapon Mastery is retained on Legacy Reroll at a partial rate (see [Legacy Reroll](LEGACY_REROLL.md)).

---

## 5. Craftsmanship Tiers

**Status: VERIFIED (tier names)**

| Tier | Name | Description |
|------|------|-------------|
| 1 | Crude | Below standard — functional but flawed; may have random negative effects |
| 2 | Common | Standard production quality; reliable but unexceptional |
| 3 | Tempered | Above average — an artisan's work; small bonuses over Common |
| 4 | Masterwork | Expert craftwork; significant bonuses; one guaranteed minor property |
| 5 | Relic | Pre-Shattering or otherwise ancient masterwork; exceptional properties |
| 6 | Mythic | Legendary — world-significant items; multiple properties, unique effects |

**Craftsmanship and Technique:** The maximum craftsmanship tier achievable is gated by the crafter's Technique attribute. A crafter with low Technique cannot produce Masterwork items regardless of materials.

---

## 6. Equipment Condition System

### Condition Degradation

Equipment condition degrades through use:
- Weapons degrade with use in combat (each hit contributes minor condition loss; absorbed armor hits cause significant degradation)
- Armor degrades from being struck (deflection causes minimal degradation; penetration causes significant)
- Condition loss rate modified by craftsmanship (Masterwork degrades slower than Common)

**Condition States:**
- **Perfect (100%):** Full statistics
- **Good (75–99%):** No change
- **Worn (50–74%):** Minor stat reduction (PROPOSED: 10%)
- **Damaged (25–49%):** Moderate stat reduction (PROPOSED: 25%); visible damage on model
- **Broken (1–24%):** Severe stat reduction; risk of catastrophic failure on heavy use
- **Destroyed (0%):** Item is non-functional; must be repaired before use

### Repair

**Field Repair:** Minor restoration using consumable repair materials. Stops further degradation; does not fully restore condition.

**Camp/Station Repair:** Full restoration at crafting stations or camp. Requires repair materials appropriate to the item's material band.

**Confectioner/Artificer Repair:** Class abilities for field repair with higher quality than standard consumables.

**Limit:** Some very old or damaged items may have a reduced maximum condition after repair (PROPOSED: a destroyed item repaired has max 90% of original stats until a Masterwork repair is performed).

---

## 7. Equipment Binding

**Binding:** Some equipment can be bound to a character, preventing trade or drop.

**Can be bound:**
- Unique quest reward items (automatically bound)
- Items with personal provenance (see Section 8)
- PvP reward cosmetics (automatically bound)

**Cannot be bound (tradeable):**
- Standard loot items
- Crafted items (unless crafted with bound materials)
- Items found in dungeons (unless unique rewards)

**PvP Implications:**
- Bound equipment cannot be looted in PvP (even in Lawless City mode — bound equipment is safe)
- Unbound equipment may be at risk in specific PvP rulesets (see [PvP and Arenas](../multiplayer/PVP_AND_ARENAS.md))

---

## 8. Provenance System

**Status: PROPOSED**

Provenance tracks the history of how an item was made, found, or earned. High provenance items have documented histories that can be identified and provide bonus properties.

**Provenance categories:**
- **Unknown:** No history recorded. Standard item.
- **Crafted:** Crafter is known. If the crafter is a notable NPC or high-Technique player character, minor bonus.
- **Battle-Taken:** The item was taken from a named enemy. Enemy's properties transfer as a minor enchantment hint.
- **Site-Found:** The item was found in a specific location. Location context may add properties.
- **Reliquarian:** The item has Memory Keeper certification — its full history is documented.

**Provenance and Enchantment:** High provenance items interact better with enchantment attempts — they have clearer histories for enchanters to work with.

---

## 9. Item Comparison UI

**Status: PROPOSED**

When comparing items, the UI should display:
- Side-by-side stat comparison (with green/red indicators for improvement/reduction)
- Current item condition vs. new item
- Body region coverage comparison (armor)
- Provenance information
- Binding status
- Enchantment slots and current enchantments

**Accessibility:** Stat comparison must not rely solely on color (green/red) — icons or text indicators required for color-blind accessibility.

---

## 10. Lineage-Specific Equipment Accommodations

| Lineage | Accommodation Required | Notes |
|---------|----------------------|-------|
| Bearkin | Standard | No modification |
| Wormkin | Full redesign | Armor covers segments; weapons may need length adjustment |
| Ringborn | Custom armor | Standard chest plates don't exist for ring body |
| Gumdrop Folk | Short-scale | Weapon length reduced; standard armor modified |
| Jellybean Folk | Minor modification | Close to standard proportions |
| Bottleborn | Neck armor specialty | Specialized neck/collar armor |
| Sourlings | Standard | Minor material preferences (sour-resistant) |
| Licoricefolk | Modified | Licorice-specific armor; standard requires alteration |
| Marshfolk | Standard + treatment | Water-resistant treatment standard |
| Jawbreaker Kin | Shell-specific | Shell armor over spherical body; limb equipment standard |
| Drakegums | Scale-compatible | Scale-specific armor; wing accommodation required |
| Swarmkin | Full specialty | Conventional armor does not work in dispersed form |

*Last updated: 2026-08-02*
