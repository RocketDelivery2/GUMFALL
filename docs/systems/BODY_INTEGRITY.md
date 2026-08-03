# GUMFALL — Body Integrity System
**Status:** VERIFIED (10 per-region properties, limb-loss consequences, recovery methods) / PROPOSED (specific threshold values, boss anatomy rules)
**Cross-references:** [GelFlow Combat](GELFLOW_COMBAT.md) · [Damage, Status, and Armor](DAMAGE_STATUS_AND_ARMOR.md) · [Lineages, Compositions, Flavors](../game-design/LINEAGES_COMPOSITIONS_FLAVORS.md) · [Character Creation](../game-design/CHARACTER_CREATION.md)

---

## 1. Overview and Design Principle

Body Integrity is the system that tracks the physical state of every body region of every character in the simulation. It is the core of what makes GUMFALL distinct from other action RPGs.

**Foundational Rule:** The body is the game. Every other system — combat, progression, equipment, status effects — interacts with and through the body. A character's capability at any moment is determined by their body's current physical state.

**Simulation vs. Presentation Separation:** Body integrity is a simulation system. Visual presentation reflects it but does not determine it. A region that looks intact is intact. A region that looks damaged may or may not have crossed a threshold — the simulation value is authoritative.

---

## 2. Per-Region Tracked Values

Every discrete body region on every character tracks the following 10 properties:

### Property 1: Local Structure

The structural integrity of this specific region. Tracks cumulative structural damage from attacks. When Local Structure reaches zero, the region is considered structurally failed — triggering limb separation (for limbs), critical damage (for torso/head), or deformation events.

**Range:** 0 to Maximum Local Structure (varies by lineage, composition, and armor)
**Drain:** Structural damage from attacks (after armor resolution)
**Restore:** Mender abilities (partial), Sugar Wells (full), Recasting

---

### Property 2: Elasticity

How readily the region deforms and recovers from deformation. High Elasticity means impacts create temporary deformation that quickly recovers. Low Elasticity means the region holds deformation — useful for armor but bad for mobility when it's a limb.

**Range:** 0–100 (PROPOSED scale)
**Drain:** Cold exposure (stiffening), Crystallizing status, age/advanced Crystal-Set progression
**Restore:** Warmth, Golden Sugar contact, Gelomancer Reshape ability

---

### Property 3: Temperature

The local temperature of the body region relative to the creature's baseline. Extreme temperatures in either direction trigger status buildup and modify material properties.

**Range:** Danger Cold → Baseline → Danger Hot (numerical range PROPOSED)
**Increased by:** Cherry Ember attacks, environmental heat, Burning status
**Decreased by:** Blue Frost attacks, cold environments, Freezing status
**Thresholds:** At Danger Cold → Freezing buildup begins; at Danger Hot → Melting buildup begins

---

### Property 4: Stickiness (Adhesion at Region Level)

The local adhesion quality of this body region's surface. Affects reattachment bonding (a severed limb's Stickiness affects how quickly it bonds back), surface adhesion in traversal, and grapple effectiveness when using this limb.

**Range:** 0–100 (PROPOSED)
**Drain:** Cold (reduces stickiness), Crystallizing status, Sour attack (sour coating reduces adhesion)
**Restore:** Warmth, Peach Bloom flavor contact, Sugar Well

---

### Property 5: Crystallization

The degree to which this body region has begun to crystallize — transitioning from gel toward hard candy structure. Moderate crystallization improves armor-equivalent; high crystallization causes brittleness; extreme crystallization is the first stage of becoming Staleborn.

**Range:** 0–100 (PROPOSED)
**Increased by:** Blue Frost attacks, cold environment exposure, Crystallizing status
**Decreased by:** Heat exposure, Gelomancer Destabilize ability, Sugar Well (restores to baseline composition)
**Thresholds:** Above 50 → natural armor effect begins; above 80 → brittleness; at 100 → region is effectively Crystal-Set regardless of base composition

---

### Property 6: Embedded Objects

Any objects currently embedded in this body region — arrows, spikes, shards, debris. Embedded objects modify the region's properties and behavior (see Section 7).

**Tracking:** List of embedded object types, sizes, and positions (PROPOSED: numerical weight/volume limits)
**Cleared by:** Manual extraction (requires action), Gelomancer Reshape, Sugar Well
**Effects while embedded:** Varies by object type (see Section 7)

---

### Property 7: Deformation

The current physical deformation state of this region — whether it has been compressed, stretched, or shaped in ways that differ from the character's baseline shape. Deformation may be temporary or persistent.

**States:** None → Minor Deformation → Significant Deformation → Severe Deformation
**Caused by:** Crush attacks, grapple holds, extreme temperature changes, gel manipulation abilities
**Effects:** Severe Deformation can prevent effective use of the region (a severely deformed arm cannot grip weapons); changes hitbox shape
**Recovery:** Gelomancer Reshape (restores instantly), Sugar Well, time (for minor deformation only)

---

### Property 8: Connection Strength

The strength of the connection between this region and adjacent regions. Specifically relevant for limbs — Connection Strength is what determines how much force is required to separate this limb from its neighbor.

**Range:** 0–Maximum (varies by lineage, composition)
**Drain:** Attacks targeting the connection point, Slice damage (severs connections specifically), embedded sharp objects near joints
**Restore:** Reattachment after separation (restores to the value the limb had at time of separation), Sugar Well

**Relationship to Local Structure:** Both Local Structure and Connection Strength must be considered for limb separation. An attack can separate a limb by reducing Local Structure to zero OR by reducing Connection Strength to zero at the joint.

---

### Property 9: Armor Coverage

The current armor coverage of this region — how much of the region's surface is protected by armor, and at what quality. This tracks both the amount of armor (coverage percentage) and its current condition.

**Range:** 0% to 100% coverage at current armor condition
**Changes:** Taking damage to the armor reduces its coverage or condition; armor can be repaired at camp or crafting stations
**Display:** Armor coverage is visible in the Body-Region Lock targeting overlay

---

### Property 10: Active Wards

Any active Ward effects currently protecting this specific body region. Wards are temporary protective effects placed by Syrupwardens, Flavorweavers, or enchanted items.

**Tracking:** List of active Ward effects with remaining duration/charges
**Placed by:** Syrupwarden Ward Channel ability, enchanted armor, Ward scrolls
**Cleared by:** Ward damage (Overmatch — see [Enchantments and Wards](ENCHANTMENTS_AND_WARDS.md)), duration expiry, voluntary dismissal

---

## 3. Body Region Map by Lineage

Different lineages have different body region arrangements. Below is the standard template and the major deviations.

### Standard Bipedal (Bearkin, Gumdrop Folk, Jellybean Folk, Sourlings, Marshfolk, Drakegums)

| Region | Type | Separable | Notes |
|--------|------|-----------|-------|
| Head | Critical | Yes — reattachable | Head loss causes significant combat debuffs |
| Torso | Core | No | Torso at 0 Structure → incapacitation |
| Left Arm | Limb | Yes — reattachable | Arm loss changes attack capability |
| Right Arm | Limb | Yes — reattachable | Dominant arm loss has greater effect |
| Left Leg | Limb | Yes — reattachable | Leg loss changes locomotion |
| Right Leg | Limb | Yes — reattachable | Both legs lost → crawl only |

### Wormkin Segmented

| Region | Type | Separable | Notes |
|--------|------|-----------|-------|
| Head Segment | Critical | Yes | Reattachable |
| Anterior Trunk | Trunk | Partial | Segment loss, not full separation |
| Mid Trunk | Trunk | Partial | Most dangerous to lose |
| Posterior Trunk | Trunk | Partial | Worm halves can function briefly independently |
| Tail | Limb | Yes | Reattachable; no major combat consequence |
| Developed Limbs (0–4) | Limb | Yes | Reattachable |

### Ringborn

| Region | Type | Separable | Notes |
|--------|------|-----------|-------|
| Ring Body | Core+Critical | No — fracture only | Ring fracture is catastrophic; Sugar Well only |
| Limbs (2–4) | Limb | Yes | Reattachable |

### Jawbreaker Kin

| Region | Type | Separable | Notes |
|--------|------|-----------|-------|
| Shell Body (head+torso unified) | Core+Critical | No | Shell fracture not equivalent to normal limb loss |
| Arms | Limb | Yes | Reattachable (slower) |
| Legs | Limb | Yes | Reattachable (slower) |

### Swarmkin (Colony)

| Region | Type | Separable | Notes |
|--------|------|-----------|-------|
| Head Mass | Critical | Colony dispersal | Recover by recall, not reattachment |
| Core Mass | Core | Colony dispersal | Large colony loss → incapacitation |
| Limb Masses | Limb equivalent | Colony dispersal | Recall within range |

---

## 4. Damage Accumulation and Threshold System

### Accumulation

Damage to a body region accumulates across attacks. Each hit to a region contributes:
- Local Structure damage (primary)
- Status buildup (secondary, type-dependent)
- Connection Strength reduction (for joint-targeted attacks)

Damage does not automatically refresh — accumulated damage persists until healed. This means a limb that has taken significant damage in one encounter is already weakened at the start of the next encounter.

### Threshold Categories

**Warning Threshold (PROPOSED: 40% of max Local Structure):** Minor visual deformation indicator. No gameplay change yet — informational only.

**Impairment Threshold (PROPOSED: 20% of max Local Structure):** The body region begins to affect gameplay:
- Arms: Grip penalty (damage output reduced, weapon drop risk on heavy hits)
- Legs: Movement speed penalty
- Head: Focus drain rate increased

**Separation Threshold (PROPOSED: 0 Local Structure OR 0 Connection Strength at joint):** Limb separation event triggers. The region physically detaches.

**Torso/Head Critical Threshold:** At 0 Local Structure for the torso, the character is immediately incapacitated. At 0 Local Structure for the head (or head lost), the character is incapacitated.

---

## 5. Deformation States

### Compression

Region has been compressed below its normal volume. Causes: heavy Crush attacks, grapple pressure, falling impact.

- Minor compression: Aesthetic only, no mechanical effect
- Moderate compression: Hitbox shape changed; attacks to compressed region may have altered contact geometry
- Severe compression: Region function impaired

### Stretching

Region has been pulled beyond its normal length. Causes: grapple pulls, Harpooner attacks, Wormkin-specific mechanics.

- Minor stretch: Aesthetic, connection-strength mild reduction
- Moderate stretch: Reach increased (for limbs) but stability reduced
- Severe stretch: Connection Strength rapidly drains

### Crystallization (Deformation State)

As Crystallization property rises, the region takes on Crystal-Set properties. High crystallization is a deformation state that changes the region's material properties even if the base composition is Soft-Set.

### Melting

The region's gel is losing viscosity from heat damage. Causes: Heat attacks, Burning status, Cherry Ember flavor attacks at high intensity.

- Minor melting: Elasticity reduced (paradoxically — melted gel deforms but doesn't spring back)
- Moderate melting: Local Structure drain begins passively
- Severe melting: Region drips away — losing volume without impact; irreversible without Sugar Well

### Adhesion (Beneficial Deformation)

High Stickiness allows a region to bond with adjacent surfaces or entities. When Stickiness is very high, a region may adhere involuntarily — useful for climbing, problematic in combat.

---

## 6. Embedded Object Mechanics

Objects can become embedded in body regions when:
- Pierce attacks succeed at penetration
- Arrow and bolt attacks land
- Environmental debris is impacted at speed
- Specific enemy abilities (spike throws, thorn attacks)

### Embedded Object Effects

**Structural:** An embedded object reduces the region's effective armor coverage (the object has breached the armor) and creates a Local Structure drain rate on the region.

**Movement:** Embedded objects in leg regions create movement penalties. Large embedded objects in arm regions create grip interference.

**Removal:** The embedded object can be extracted manually (action, Stamina cost, brief vulnerability) or by Gelomancer ability. Removal halts the drain but does not restore Structure already lost.

**Projectile embedding:** When an arrow is embedded in a limb, that limb cannot be used for that arm's full range of motion until the arrow is removed. The arrow is also visible and targetable — attacking the protruding shaft can drive it deeper (worse effects) or shatter it (removes without extraction).

---

## 7. Limb Loss Triggers and Threshold Rules

Limb separation is triggered when:
1. **Local Structure reaches zero** in the limb region, OR
2. **Connection Strength at the joint reaches zero**

Both paths lead to the same outcome: physical separation.

### Separation Force Direction

The direction and speed of the separation depends on the attack that caused the final threshold breach:
- High-force attacks (Crusher heavy attack) send the limb flying
- Slice attacks produce a clean cut — the limb falls or stays close
- Ice shattering produces fragments rather than a clean limb

### Limb Landing

After separation, the limb is a physical object in the world:
- It lands at a physics-determined location
- It retains the properties it had at time of separation (Local Structure, Crystallization, embedded objects)
- It can be picked up by the player (recovery, or as improvised weapon — Gummy Brawler class feature)
- It can be targeted and damaged further by enemies

---

## 8. Limb Loss Gameplay Consequences

### Arm Loss

**Primary arm (weapon-holding arm):**
- Primary weapon unequipped (weapon dropped or held by remaining arm at reduced effectiveness)
- Attack animations modified — all attacks become one-arm variants
- Some class abilities that require two arms become unavailable (flagged in Ability Graph)
- Grip strength reduced — some heavy weapons cannot be used single-handed without Might threshold

**Secondary arm:**
- Shield use unavailable
- Off-hand weapon unavailable
- Some two-handed weapon abilities unavailable
- Defensive options reduced

**Both arms:**
- No weapon use (body-only combat — headbutt, bite, some Gummy Brawler techniques)
- Some class abilities still available (ability-graph-dependent)
- Significant capability reduction

### Leg Loss

**One leg:**
- Movement speed reduced significantly
- Dodge distance reduced
- Rolling/running movement changed to hop-and-balance animations
- Stability reduced

**Both legs:**
- Crawl movement only (very slow)
- Jump not available
- Some defensive options unavailable
- Upright attacks changed to ground-level attack variants

### Head Loss

- Immediate incapacitation (head loss triggers the same result as Vitality zero)
- The character falls — they are not destroyed, but they are immediately non-functional
- Revival at Sugar Well restores the head from reserve gel
- AI-controlled characters with head loss may continue briefly on instinct before collapse

### Balance and Coordination Consequences

Asymmetrical limb loss creates balance issues that affect all movement — a one-legged character compensates; a one-armed character adjusts their center of gravity. These are not purely negative — the adaptation animations and resulting movement style communicate the character's resilience.

### AI Behavior Changes

Enemy AI adapts to the player's limb-loss state:
- Enemies with Combat Intelligence (Tactical, Strategic) will target remaining limbs more aggressively
- Enemies will adjust attack patterns to exploit the player's reduced range or mobility
- This is not "reading inputs" — it is responding to observable capability changes

### Audio Changes

Body region loss changes the character's audio profile:
- Footstep sounds change with leg loss
- Weapon impact sounds change with arm-loss adaptations
- Victory audio may have character-specific lines acknowledging the injury state

---

## 9. Recovery Methods

### 9.1 Reattachment (Field Recovery)

**Conditions:**
- The separated limb must be within reattachment range (standard: 1.5 body-lengths; varies by lineage and Agility/Adhesion)
- The character must have sufficient Adhesion to bond
- A brief period of stillness is required (PROPOSED: 2 seconds for standard reattachment; reduced by Adhesion)

**Process:**
1. Player activates reattachment action while near their separated limb
2. A brief animation plays — the limb pulls toward the stump and bonds
3. The limb is reattached at the Local Structure value it had at time of separation (no restoration on reattachment)
4. Connection Strength is partially restored on reattachment (PROPOSED: 50% of max)

**Combat Reattachment:** Reattachment during active combat is possible but requires the 2-second stillness window. This is a tactical decision — accept vulnerability for recovery.

**Limb Catch Reaction:** If the player inputs a Limb Catch reaction immediately after separation, they grab the limb before it falls (if within range), maintaining their opportunity to reattach immediately. A perfect Limb Catch also prevents enemies from targeting the limb.

---

### 9.2 Sugar Wells

**Full restoration:** Sugar Wells restore all body regions to full Local Structure, clear all status effects from all regions, restore Vitality, Stamina, Focus, Adhesion, and Stability to full.

**Limb regeneration:** If a limb was separated and not reattached — or was separated and the limb was lost/destroyed — the Sugar Well regenerates the limb from reserve gel material.

**Temperature and Crystallization reset:** Sugar Wells restore all regions to the character's baseline composition temperature and Crystallization level.

**Not a full Recasting:** Sugar Wells restore integrity but do not change composition or flavor affinity.

---

### 9.3 Recasting

**Definition:** Full physical reconstruction of the character's body, including restructuring deformed regions, restoring destroyed limbs, and potentially changing composition properties in specific ways.

**Who can perform it:** Gelomancer (Fleshshaper specialty, Fusionist specialty in specific ways). Cannot be done by the character alone. Requires an allied or friendly NPC Gelomancer.

**Gameplay use:** Primarily available at Gelwright Circle outposts, hospital-equivalents, and as a companion ability (Gelomancer companion).

**Limits:** Recasting restores the body to its original parameters. It does not improve on the baseline. A character who was born Soft-Set cannot be Recast as Crystal-Set.

---

### 9.4 Regeneration (Class Abilities)

Gelomancer (Mender specialty): Moderate field restoration of body regions during or after combat. Does not fully replace Sugar Wells but provides combat-relevant recovery.

Confectioner (Apothecandy specialty): Targeted medical treatment that restores specific region properties, removes status effects, and extracts embedded objects.

---

### 9.5 Prosthetics

**Status: PROPOSED — prosthetic system concept, implementation details TBD**

A lost limb that cannot be reattached (because the limb was destroyed, irrecoverable, or the player is far from a Sugar Well) can be replaced with a prosthetic limb:

- Prosthetics are crafted items (Candy Artificer, Confectioner, or purchased)
- Prosthetic limbs provide partial function — specific abilities are restored, others remain unavailable
- Prosthetic quality varies by craftsmanship (Common → Masterwork prosthetics)
- Some prosthetics have built-in weapon functionality (Artificer specialty integration)
- Prosthetics cannot be reattached and do not count as the original limb — Sugar Well clears them and restores the original limb instead

---

## 10. Presentation vs. Gameplay Separation Rule

**CRITICAL DESIGN RULE:** Visual damage representation and gameplay capability are independent systems that must be kept in sync by the simulation — but the simulation is always authoritative.

**What this means in practice:**
- A body region can look heavily damaged (dark color, deformation visible) but still be mechanically functional because its Local Structure has not crossed a threshold.
- A body region can look pristine but have significant accumulated damage in its simulation values.
- Status effects have visual indicators but the gameplay effect is governed by the simulation counter, not the visual.
- **Exploit prevention:** No player can assess their or an enemy's true body region status purely from visual observation. Body-Region Lock targeting overlay provides gameplay-relevant information (structural status) separate from the visual presentation.

---

## 11. Boss Anatomy Special Rules

**Status: PROPOSED**

Boss enemies have extended body integrity rules:

### Larger Anatomy

Boss body regions may have multiple sub-regions — a large serpentine boss may have 6+ trunk segments, each tracked independently.

### Armor Layers

Bosses may have multiple armor layers on specific regions (natural armor + crafted armor + enchanted layer). Each must be degraded sequentially.

### Regeneration Organs

Some bosses have specific body regions that regenerate other regions. Destroying the regeneration organ removes this capability. Regeneration organs are typically:
- Visually distinct (a glowing core, a pulsing structure)
- Well-protected (high armor coverage, high Local Structure)
- A key phase-change trigger if destroyed

### Detachable Parts

Some boss body regions can be detached intentionally by the boss or by player attack. A detached boss component may:
- Act as an independent attacker
- Provide environmental hazards
- Be destroyed separately for a reward
- Reattach to the boss after a timer or phase change

### Phase Changes

When a boss's critical regions reach specific threshold percentages (PROPOSED: 75%, 50%, 25% of max Local Structure on core region), a phase change may trigger:
- New attack patterns unlock
- Anatomy changes (regeneration, new regions exposed)
- AI behavior shifts
- Environmental changes

**No generic immunity:** Bosses may not be immune to damage types. They may have high resistance, high armor, or regeneration — but a player who understands the boss's anatomy and applies the right tools can always progress.

---

## 12. Accessibility — Reduced Body Separation Options

**Status: PROPOSED**

For players who find limb separation and body horror aspects distressing:

**Reduced Limb Separation Mode:**
- Limb separation is replaced with extreme deformation (the limb still loses function but does not physically separate)
- Reattachment mechanic is replaced with a "stabilize region" action that restores function
- Sugar Wells restore all region function as normal

This mode does not affect difficulty or any other mechanics — only the visual and mechanical representation of critical damage.

**Body Horror Reduction:**
- A separate toggle reduces the graphic quality of body deformation effects
- Melting and crystallization effects are toned down visually
- Embedded object visuals are reduced (arrow stubs rather than full arrows)

*Last updated: 2026-08-02*
