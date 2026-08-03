# GUMFALL — Enchantments and Wards
**Status:** VERIFIED (probability table, rank multipliers, overmatch formula, malady types) / PROPOSED (enchantment category lists, ward categories)
**Cross-references:** [Damage, Status, and Armor](DAMAGE_STATUS_AND_ARMOR.md) · [Weapons, Mastery, and Equipment](WEAPONS_MASTERY_AND_EQUIPMENT.md) · [Crafting, Economy, and Loot](CRAFTING_ECONOMY_AND_LOOT.md) · [Progression](PROGRESSION.md)

---

## 1. Natural Enchantment Probability

When loot is generated, the following probabilities determine how many natural enchantments the item has:

**Status: VERIFIED**

| Enchantments | Probability |
|-------------|-------------|
| Zero enchantments | ~99.1950% |
| One enchantment | 0.7500% |
| Two enchantments | 0.0550% |
| Three enchantments | 0.0045% |
| Malady | 0.0005% |

**Notes:**
- These are base probabilities. Rank multipliers (Section 2) modify the effective probability for higher-rank enemies.
- These probabilities apply to natural (found/dropped) enchantments, not crafted enchantments.
- The sum of all enchantment probabilities + zero probability = 100%.
- Malady is included in the total; it replaces enchantments, not supplements them (a Malady item has a Malady instead of enchantments).

---

## 2. Rank Multiplier Table

Enchantment probability is multiplied by the rank multiplier of the enemy or loot source:

**Status: VERIFIED**

| Rank | Multiplier | Notes |
|------|-----------|-------|
| Standard | ×1 | Base probability as above |
| Veteran | ×1.5 | 50% increase to enchantment probability |
| Elite | ×3 | 3× enchantment probability |
| Champion | ×6 | 6× enchantment probability |
| Boss | ×12 | 12× enchantment probability |
| Mythic | ×25 | 25× enchantment probability |

**Example calculation:** A Champion-rank enemy has a drop with one enchantment probability of 0.7500% × 6 = 4.500%.

**Important:** Rank multipliers apply to the per-enchantment-count probabilities independently. They do not simply linearly scale — each probability (1 enchantment, 2 enchantments, etc.) is multiplied separately, and the zero-enchantment probability adjusts to compensate. (PROPOSED: implementation to verify exact formula behavior at extreme multipliers.)

---

## 3. Enchantment Categories

**Status: PROPOSED — specific enchantments within categories require design work**

### Category 1: Slayers

Enchantments that deal increased damage or apply special effects against specific targets.

**Types:**
- Lineage Slayers (e.g., "Gummyfolk Slayer" — bonus damage vs. Gummyfolk family)
- Rank Slayers (e.g., "Minion Slayer" — bonus damage vs. Minion-rank enemies)
- Composition Slayers (e.g., "Crystal-Breaker" — bonus damage vs. Crystal-Set compositions)
- Flavor Slayers (e.g., "Ember Quencher" — bonus damage vs. Cherry Ember enemies)
- Role Slayers (e.g., "Ambusher's Bane" — bonus damage when not ambushed)

**PvP:** Slayer enchantments in PvP apply at reduced effectiveness (PROPOSED: 50%) and only apply to lineage/composition — rank and role slayers do not function against players.

---

### Category 2: Injury

Enchantments that enhance the weapon's ability to cause or worsen specific body conditions.

**Types:**
- Connection Severers (increased Connection Strength damage at joints)
- Wound Deepeners (enhanced Wounding status buildup)
- Crystal Splintering (enhanced Crystallizing buildup)
- Adhesion Dissolvers (reduces target's Adhesion on hit)
- Deformation Amplifiers (enhanced Deformation severity)

**PvP:** Injury enchantments have capped buildup per hit in PvP contexts.

---

### Category 3: Elemental

Enchantments that add or enhance elemental damage types.

**Types:**
- Flame Imbue (adds Heat damage)
- Frost Edge (adds Cold damage)
- Sour Coat (adds Sour damage)
- Sugar Blessing (adds Sugar damage — uncommon, primarily defensive items)
- Shock Wrap (adds Shock damage)
- Spirit Infusion (adds Spirit damage — rare, ward-penetrating application)

**PvP:** Elemental enchantments respect diminishing returns on status buildup (Section 6).

---

### Category 4: Control

Enchantments that enhance crowd-control effects or movement restriction.

**Types:**
- Pinning (enhanced Pin application on Pierce attacks)
- Binding (enhanced Stickiness effect on hit — target moves slower)
- Stagger Amplification (enhanced Stability damage)
- Slowcasting (attacks that apply Silenced buildups on hit — rare)

**PvP:** Pinning and Binding enchantments are subject to the strictest PvP budget caps (see Section 7).

---

### Category 5: Sustain

Enchantments that support the wielder through resource generation or restoration.

**Types:**
- Vitality Drain (small Vitality restoration on hit)
- Stamina Feed (Stamina restoration on successful parry)
- Focus Channel (Focus restoration on body-region hit)
- Adhesion Restore (Adhesion partial restoration on kill)
- Reserve Draw (Gel Reserve restoration for Gelomancers on kill — rare)

**PvP:** Sustain enchantments are capped at 50% effectiveness in ranked PvP.

---

### Category 6: Behavior

Enchantments that change how the weapon behaves or interacts with the world.

**Types:**
- Reach Extension (slightly increases weapon reach)
- Recovery Acceleration (reduces Recovery phase duration — rare and powerful)
- Silence Break (weapon attacks ignore Silence status — specialized)
- Material Affinity (bonus damage when used against a specific material band)
- Provenance Echo (weapon behaves as if it has battle-provenance from a specific source)

---

## 4. Malady — Full Detail

**Status: VERIFIED (malady types) / PROPOSED (specific effects within types)**

A Malady is a cursed enchantment. It replaces enchantments (a Malady item does not also have Slayer or Elemental enchantments). Malady items are extremely rare (0.0005% base probability before rank multipliers) and extremely dangerous — but also exceptionally powerful.

**Malady general properties:**
- Cannot be removed by standard enchanting processes
- Some Maladies can be partially countered by specific Sanctuary effects
- A Malady item's power typically far exceeds the power of a standard one-, two-, or three-enchantment item
- Malady items cannot be crafted intentionally — they are only found

### Malady Type 1: Omnislayer

**Effect:** Massive bonus damage against all targets — lineage, rank, and composition regardless.
**Cost:** The wielder takes a percentage of the damage dealt to themselves (PROPOSED: 10–20%).
**Sanctuary partial counter:** Spirit-focused Sanctuary effects reduce the self-damage portion.
**Design Note:** Omnislayer is the "glass cannon" Malady — extraordinary offensive power at genuine personal risk.

---

### Malady Type 2: Ruin

**Effect:** Attacks with this item cause permanent (un-healable by field methods) Regional Structure damage. Only Sugar Wells can heal Ruin damage.
**Cost:** The weapon also ruinously damages itself — condition degrades much faster than normal, and reaching Broken condition with a Ruin weapon may trigger a backlash.
**Sanctuary partial counter:** Material Wards reduce Ruin's permanent aspect to a semi-permanent one (healable by Mender abilities, not just Sugar Wells).
**Design Note:** Ruin is the "siege" Malady — devastating to enemies who can't reach Sugar Wells, risky for the wielder who also can't neglect weapon condition.

---

### Malady Type 3: Affliction

**Effect:** Attacks cause an Affliction — a unique compounded status that combines multiple status effects simultaneously (e.g., Burning + Crystallizing simultaneously, or Sourrot + Wounding).
**Cost:** The Affliction is contagious — nearby allies of the wielder are not immune to the Affliction's secondary spread.
**Sanctuary partial counter:** Cleansing Sanctuary effects reduce Affliction spread radius and slow buildup.
**Design Note:** Affliction is the "careful" Malady — powerful but requires awareness of friendly fire risk.

---

### Malady Type 4: Finality

**Effect:** Attacks that drop a target below 25% Vitality trigger an instant incapacitation effect.
**Cost:** The wielder cannot be revived by standard ally revival during the encounter in which they use Finality's effect. (Sugar Wells still work.)
**Sanctuary partial counter:** Conviction-based Sanctuary grants the wielder a revival exception (one per encounter).
**Design Note:** Finality is the "executioner" Malady — lethal at closing, but the wielder accepts that they fight alone if they fall.

---

## 5. Ward Categories

**Status: PROPOSED — full ward list pending design work**

### Vitality Wards
Absorb incoming Core Vitality damage up to the Ward's capacity. When the Ward's capacity is depleted, it breaks. Regenerates out of combat.

### Structure Wards
Protect a specific body region from Regional Structure damage. The Ward absorbs Structure damage; when absorbed capacity is exceeded, the Ward breaks and that hit's remaining damage passes through.

### Elemental Wards
Reduce incoming elemental damage of a specific type. Unlike Vitality and Structure Wards, Elemental Wards are not capacity-limited — they provide a flat damage reduction that applies every hit. However, Overmatch can break them.

### Spirit Wards
The primary defense against Spirit damage and enchantment effects. Spirit Ward Strength is the value used in the Overmatch formula. High Spirit Wards make Spirit damage relatively ineffective; Overmatch is required to penetrate.

### Stability Wards
Contribute to the character's effective Stability against knockback and stagger. Stability Wards are consumed (reduce Ward value) when absorbing Stability damage, regenerating between hits.

---

## 6. Overmatch Formula and Buildup Reduction Band Table

**Formula (VERIFIED):**
`Overmatch = Enchantment Pressure − Ward Strength`

**Full Buildup Reduction Band Table (PROPOSED):**

| Overmatch | Ward Status | Enchantment Buildup Reduction |
|-----------|------------|-------------------------------|
| Negative (Ward > Pressure) | Ward fully holds | 100% buildup blocked |
| 0 | Ward exactly matched | 75% buildup blocked |
| 1–10 | Ward stressed | 65% buildup blocked |
| 11–25 | Ward cracked | 40% buildup blocked |
| 26–50 | Ward breaking | 20% buildup blocked |
| 51–100 | Ward broken | 5% buildup blocked |
| 100+ | Ward shattered | 0% blocked; bonus buildup |

---

## 7. Crafting Enchantments

### One Enchantment by Craft

A skilled enchanter (PROPOSED: Intellect 6+ or Flavorweaver specialization) can intentionally apply one enchantment to an item. The enchantment category must be within the crafter's specialization; the specific enchantment within that category is chosen.

**Requirements:** Item at Masterwork craftsmanship or above. Enchantment materials. Crafter specialization in the enchantment category.

---

### Two Enchantments by Master

Applying a second enchantment to an already-enchanted item requires Master-level crafting. The process risks destabilizing the first enchantment.

**Requirements:** Item with one existing enchantment. Crafter at Master Technique level. Failure risk: PROPOSED 15% that the first enchantment degrades.

---

### Three Enchantments by World/Relic

Three-enchantment items cannot be crafted through normal artisan processes. They are found — ancient items from before the Shattering (Relic craftsmanship) or items with world-significant provenance. Some legendary Gelwright Circle rituals may attempt three-enchantment application, but the success rate is extremely low.

**Design Note:** Three-enchantment items in the economy should be extremely rare and prestigious. They should not be reliably producible.

---

## 8. PvP Enchantment Budget Rules

**Status: PROPOSED baseline**

In PvP contexts, enchantment pressure is capped to prevent enchantment escalation:

- **Ranked Arena:** Total enchantment pressure per equipment slot is capped (PROPOSED: 50% of theoretical max)
- **Guild Wars / Battlegrounds:** Relaxed cap (PROPOSED: 75%)
- **Lawless City / Invasions:** No cap — all enchantments at full effectiveness

**Malady in PvP:**
- Malady items are permitted in Lawless City and Invasion contexts
- Malady items are not permitted in Ranked Arena or Guild Wars
- Battlegrounds: Malady permitted but Malady effects are capped (PROPOSED: 50% of full effect)

---

## 9. Tournament Normalization

**Status: PROPOSED**

Tournament events normalize equipment to prevent pay-to-win or equipment-level advantages:

- All participants' equipment is adjusted to a normalized stat baseline
- Craftsmanship tier reduced to Masterwork for all
- Enchantments reduced to one per item, at normalized pressure values
- Material band normalized to the event's specified band

Tournament-normalized items still retain their original stats outside tournament context.

---

## 10. Enchantment Readability and Visual Design

**Design Requirement:** Players must be able to read that an enemy or item has an enchantment active from visual cues, without relying on tooltip display.

**Visual language for enchantments (PROPOSED):**
- Elemental enchantments: Appropriate color glow matching damage type (red/orange for Heat, blue for Cold, etc.)
- Slayer enchantments: Subtle runic pattern visible on weapon surface
- Injury enchantments: Darker edge treatment — shadowed blades
- Control enchantments: Subtle crystalline formations on weapon surface
- Sustain enchantments: Warm inner glow
- Malady items: Distinct visual — PROPOSED dark surface with inverted color of their damage type (dark red for a cold-damage Malady)

**Accessibility:** Enchantment visual indicators must not rely solely on color. Icons, patterns, and audio cues supplement color information.

*Last updated: 2026-08-02*
