# GUMFALL — Classes and Specialties
**Status:** VERIFIED (class names, specialty names, resource names) / PROPOSED (specific ability names, level feature details, numeric values)
**Cross-references:** [Character Creation](CHARACTER_CREATION.md) · [Attributes and Stats](ATTRIBUTES_AND_STATS.md) · [GelFlow Combat](../systems/GELFLOW_COMBAT.md) · [Body Integrity](../systems/BODY_INTEGRITY.md)

---

## 1. Class System Overview

GUMFALL has 12 classes organized by their primary combat resource and identity. Each class:
- Has a distinct named resource mechanic
- Offers 4 specialties (selected at Level 3)
- Has features at Levels 1–12 (Foundation era)
- Gains advanced features at Level 4 (first advancement), Level 8 (second advancement), Level 10 (signature), and Level 12 (capstone)
- Can multiclass after Level 4 under bounded multiclass rules

**Multiclass Rules (Overview):**
- After Level 4, a player may take a level in a second class.
- Multiclass levels count toward total character level.
- Primary class resource remains the first-class resource.
- Secondary class features are available at reduced effectiveness (PROPOSED: 75% effectiveness, UNKNOWN exact scaling).
- Specialties from the secondary class are available only if the player has taken 3+ levels in that class.
- Some class combinations have documented synergies (see Section 14).

---

## 2. Edgebearer

**Resource:** Edge Alignment
**Resource Loop:** Edge Alignment tracks the geometric precision of the character's blade positioning. Actions that maintain proper edge-to-target geometry build Alignment; actions that waste cuts or use poor form drain it. High Alignment enables precision finishers and enhanced weapon properties.

**Identity:** The Edgebearer is a weapon-and-geometry fighter. They study the relationship between their blade, their body, and their target's body. The goal is not to swing hard — it is to find the right angle. An Edgebearer at peak Alignment is cutting with surgical efficiency; an Edgebearer who has let their Alignment slip is just swinging a weapon.

**Party Role:** Primary melee DPS, duelist, single-target specialist
**Solo Viability:** High — self-sufficient, strong single-target damage
**PvP Counterplay:** Target range and disruption of Alignment buildup. Edgebearers are strong in 1v1; less effective against multiple opponents who force poor alignment decisions.

### Level 1–12 Feature Table

| Level | Feature | Description |
|-------|---------|-------------|
| 1 | Edge Read | Passive: gain Edge Alignment when landing clean hits to non-armored regions |
| 1 | Form Stance | Active: enter a stance that improves Edge Read rate but reduces dodge distance |
| 2 | Clean Cut | At max Alignment: next attack ignores light armor's deflection chance |
| 3 | Specialty Selection | Choose from Duelist, Cleaver, Ribbonblade, Sugarsteel Knight, or Sheathed Edge |
| 4 | Advancement: Blade Geometry | PROPOSED: Alignment builds from parries as well as hits |
| 5 | Exposure | Passive: Identify body-region armor gaps after observing 3 attack patterns |
| 6 | Edge Shift | Active: Transfer a portion of Alignment to a different weapon mid-combat |
| 7 | Precision Strike | Heavy attack variant that consumes half Alignment for guaranteed body-region hit |
| 8 | Advancement: Signature Alignment | PROPOSED: Specialty-specific advancement feature |
| 9 | Blade Memory | Passive: short retention of partial Alignment after stagger |
| 10 | Signature: Perfect Form | At max Alignment: next attack sequence cannot be parried |
| 11 | Counter-Edge | Parry counter-attack builds double Alignment |
| 12 | Capstone: Geometry Mastered | Alignment resets to half rather than zero on miss; clean kills restore full Alignment |

**Specialties:**
- **Duelist:** Single-target focus, enhanced parry quality, 1v1 advantage mechanics
- **Cleaver:** Sweeping attacks, multi-region damage per strike, armor-penetration on Alignment spend
- **Ribbonblade:** Long-reach slicing, sustained bleeding application, distance maintenance
- **Sugarsteel Knight:** Defensive-stance Edgebearer, shield integration, alignment from blocking
- **Sheathed Edge:** Draw-attack focus, extreme single-hit precision, concealed weapon mechanics

**Injury Fallback:** Edgearers who lose an arm adapt to one-arm techniques. Edge Alignment still builds; one-arm precision carries a minor penalty that decreases with Technique investment. (The tutorial companion is an example of this adaptation.)

**Exploration Utility:** Blade use for cutting rope bridges, opening sealed containers, harvesting specific materials.

---

## 3. Pinshot

**Resource:** Focus Marks
**Resource Loop:** Pinshot characters place invisible Focus Marks on targets through sustained observation or specific abilities. Marks can be detonated simultaneously or in sequence for enhanced effects. Managing which targets are marked and when to detonate is the core skill expression.

**Identity:** The Pinshot is a patience-and-precision fighter. They study the battlefield before acting, mark multiple targets or locations, then trigger coordinated results. The Pinshot who fires once per ten seconds and never misses is doing their job correctly.

**Party Role:** Ranged DPS, utility/control, target marking
**Solo Viability:** High — strong vs. single targets, adequate vs. groups with clever mark placement
**PvP Counterplay:** Aggressive pressure prevents marking. Pinshots need space and time to function optimally.

### Level 1–12 Feature Table

| Level | Feature | Description |
|-------|---------|-------------|
| 1 | Mark Shot | Place a Focus Mark on target with any ranged attack |
| 1 | Detonate | Active: trigger all Marks for base damage and minor status |
| 2 | Hold Breath | Stance: increase precision dramatically while stationary; cannot dodge |
| 3 | Specialty Selection | Choose Farshot, Quiverstorm, Trickshot, Beastbound, or Wallpin |
| 4 | Advancement: Compound Mark | PROPOSED: Two Marks on same target stack damage modifier |
| 5 | Weak Point Study | Passive: Marks reveal body-region structural values |
| 6 | Pin | Spend a Mark to embed ammunition in target's body region (restricts movement) |
| 7 | Redirect Shot | Ricochet shot can Mark a second target off the first hit |
| 8 | Advancement: Specialty advancement feature |  |
| 9 | Mark Patience | Marks last 2× longer before fading |
| 10 | Signature: Convergence Shot | All Marks on all targets detonate simultaneously |
| 11 | Farsight | Passive: enhanced detection range and awareness through obstacles |
| 12 | Capstone: Never Miss | If the first shot in a Hold Breath sequence misses, it is automatically corrected (one use per encounter) |

**Specialties:**
- **Farshot:** Extreme range, reduced damage falloff, wind-reading mechanics
- **Quiverstorm:** Rapid successive shots, mark stacking speed, AoE detonate patterns
- **Trickshot:** Ricochet and arc paths, environmental interaction, misdirection
- **Beastbound:** Companion-linked shots, beast-target bonuses, monster knowledge integration
- **Wallpin:** Pin embedding focus, movement restriction, ambush setup

**Injury Fallback:** Arm injury restricts crossbow/bow use. One-arm techniques available; some specialty options become unavailable until recovery.

**Exploration Utility:** Pinning items at range, triggering distant mechanisms, lighting at range.

---

## 4. Skewer

**Resource:** Leverage
**Resource Loop:** Leverage builds through actions that use the weapon's reach as a physical fulcrum — sustained thrust, maintaining contact with a pinned target, or holding formation with other Skewers. High Leverage enables powerful repositioning attacks and extended pin duration.

**Identity:** The Skewer fights with reach and control. They want their target held at the end of a spear, unable to close distance, unable to leave. Skewer combat is about ownership of the space around the weapon tip.

**Party Role:** Reach DPS, crowd control, formation anchor
**Solo Viability:** Medium — effective but benefits significantly from party target locks
**PvP Counterplay:** Closing inside spear range negates most Leverage benefits.

### Level 1–12 Feature Table

| Level | Feature | Description |
|-------|---------|-------------|
| 1 | Thrust Lock | Pin a target with a successful thrust; builds Leverage |
| 1 | Hold the Line | Formation bonus: gain Leverage when adjacent allies also hold position |
| 2 | Sweep | Area attack clears engaged enemies, builds minor Leverage |
| 3 | Specialty Selection | Choose Formation Guard, Sky Lancer, Harpooner, or Thorn Dancer |
| 4 | Advancement: Extended Pin | Pin duration scales with Leverage stored |
| 5 | Braced | Passive: increased Stability when holding position |
| 6 | Counter-Thrust | Reactive thrust that builds Leverage off incoming attack |
| 7 | Dismount | Specialized attack to knock riders or elevated targets |
| 8 | Advancement: Specialty feature |  |
| 9 | Leverage Shift | Transfer Leverage to a tactical repositioning sprint |
| 10 | Signature: Perfect Thrust | Single guaranteed body-region pin, consumes all Leverage |
| 11 | Wall of Spears | Formation ability: synchronized thrust with party members |
| 12 | Capstone: The Point | Maximum Leverage: weapon becomes essentially unpushable for one sustained exchange |

**Specialties:**
- **Formation Guard:** Defensive formation, protection for allies, combined-arms tactics
- **Sky Lancer:** Aerial and elevated targets, vertical thrust attacks, elevated terrain mastery
- **Harpooner:** Attachment to targets, pulling, environment leverage mechanics
- **Thorn Dancer:** Mobile spear use, agile retreat-and-thrust, high-movement Leverage buildup

**Injury Fallback:** Spear use with one arm at significant penalty. Thorn Dancer specialty has dedicated one-arm adaptations.

**Exploration Utility:** Pole-vaulting, reaching elevated targets, pinning environmental elements.

---

## 5. Crusher

**Resource:** Momentum
**Resource Loop:** Momentum builds through sustained movement toward targets and heavy attacks. Momentum cannot be built while stationary. High Momentum enables devastating charges, massive knockback, and area impacts. Momentum decays rapidly when stationary.

**Identity:** The Crusher is a physics engine. They must keep moving to remain dangerous. The ideal Crusher fight is a series of accelerating collisions, each building on the last.

**Party Role:** Bruiser, area damage, knockback control
**Solo Viability:** High — mobility makes them effective solo
**PvP Counterplay:** Disrupting Momentum through terrain, stagger, or forced stops.

### Level 1–12 Feature Table

| Level | Feature | Description |
|-------|---------|-------------|
| 1 | Charge | Sustained run that builds Momentum |
| 1 | Momentum Strike | Heavy attack that spends Momentum for bonus knockback |
| 2 | Boulder | Passive: body acts as weapon at high Momentum — contact does damage |
| 3 | Specialty Selection | Choose Breaker, Juggernaut, Launcher, or Shieldmaul |
| 4 | Advancement: Mass | Momentum at 75%+ increases effective Might for calculations |
| 5 | Obstacle Crash | Run through light barriers without losing full Momentum |
| 6 | Redirect | Change direction mid-charge without full Momentum loss |
| 7 | Ground Pound | Aerial drop attack generates burst Momentum from landing impact |
| 8 | Advancement: Specialty feature |  |
| 9 | Inertia | Passive: stagger resistance scales with current Momentum |
| 10 | Signature: Unstoppable | One charge per encounter cannot be interrupted by any defensive action |
| 11 | Aftershock | High-Momentum landing creates a structural shockwave in adjacent terrain |
| 12 | Capstone: Mass Event | Maximum Momentum attacks create terrain deformation (PROPOSED: leaves temporary difficult terrain) |

**Specialties:**
- **Breaker:** Armor destruction focus, Shield bypass, maximum single-target force
- **Juggernaut:** Sustained Momentum maintenance, becoming harder to stop, crowd-through mechanics
- **Launcher:** Knockback maximization, sending targets airborne, team combo setups
- **Shieldmaul:** Shield-as-weapon variant, defensive Momentum buildup

**Injury Fallback:** Leg injury reduces Momentum buildup. Crusher must adapt to shorter charge distances. Arm injury has less impact (body itself becomes the weapon).

**Exploration Utility:** Breaking environmental obstacles, creating new paths through terrain.

---

## 6. Licorice Rogue

**Resource:** Advantage
**Resource Loop:** Advantage builds when the Licorice Rogue attacks a target that is unaware, distracted, engaged with another threat, or in a debuffed state. Advantage stacks grant increasing precision and a damage multiplier. Losing Advantage (being the sole focus of an aware target) rapidly drains the resource.

**Identity:** The Licorice Rogue creates situations. They do not fight fair — fair fights are a resource waste. Every ability they have is designed to create a condition of Advantage that they then exploit precisely and withdraw before the target can respond.

**Party Role:** Single-target assassin, utility, debuff application
**Solo Viability:** Medium — requires setup time that is harder solo
**PvP Counterplay:** Predictable movement, awareness mechanics (Farsight), direct engagement.

### Level 1–12 Feature Table

| Level | Feature | Description |
|-------|---------|-------------|
| 1 | Exploit | When attacking target engaged with another character, gain Advantage |
| 1 | Slip | Short-range repositioning that does not consume Dodge |
| 2 | Blinding Strike | Attack that reduces target's awareness, extending Advantage window |
| 3 | Specialty Selection | Choose Cutpurse, Binder, Trapper, or Syrup Shade |
| 4 | Advancement: Compound Advantage | Third Advantage stack grants a guaranteed critical region hit |
| 5 | Sticky Fingers | Passive: item acquisition from engaged targets |
| 6 | Layered Approach | Advantage builds from environmental setup (traps, terrain manipulation) |
| 7 | Vanish | Short-duration concealment that resets target awareness |
| 8 | Advancement: Specialty feature |  |
| 9 | Shadow Economy | Some abilities cost Advantage instead of Stamina |
| 10 | Signature: Opening | One guaranteed Advantage attack per encounter that ignores all defensive responses |
| 11 | Exposed | High Advantage attacks reveal target's body-region weaknesses |
| 12 | Capstone: Full Advantage | Maximum Advantage is now permanent against distracted targets |

**Specialties:**
- **Cutpurse:** Item theft, economic disruption, currency in PvE contexts
- **Binder:** Adhesion-based restraint, wrap and pin mechanics, escape prevention
- **Trapper:** Environmental trap setup, delayed Advantage generation
- **Syrup Shade:** Stealth-focused, syrup-based concealment, ambush setup

**Injury Fallback:** Flexible enough that most injuries have adapted techniques. Licorice Rogue has the most comprehensive injury fallback library of any class.

**Exploration Utility:** Lock bypass, item retrieval, NPC pickpocketing, trap detection and disarming.

---

## 7. Gummy Brawler

**Resource:** Bounce
**Resource Loop:** Bounce builds when the Gummy Brawler receives impacts and redirects that force. Taking hits, making contact with terrain during knockback, and deflecting blows all build Bounce. Spending Bounce unleashes explosive counter-attacks with the redirected energy.

**Identity:** The Gummy Brawler turns the opponent's force against them. Every hit they take is an investment. They do not flinch from attacks — they absorb, build, and return. The Gummy Brawler who has survived a three-second combo is more dangerous at the end than the beginning.

**Party Role:** Off-tank, counter-attacker, crowd absorber
**Solo Viability:** High — self-sustaining through Bounce buildup
**PvP Counterplay:** Light, rapid attacks that don't build Bounce. Depriving them of impact.

### Level 1–12 Feature Table

| Level | Feature | Description |
|-------|---------|-------------|
| 1 | Bounce Read | Taking a hit builds Bounce |
| 1 | Counter-Bounce | Spend Bounce for explosive counter-punch |
| 2 | Body Buffer | Passive: damage to well-defended regions builds more Bounce |
| 3 | Specialty Selection | Choose Sweet Science Boxer, Taffy Wrestler, Rebounder, or Iron Gel |
| 4 | Advancement: Cascade | Spending Bounce also generates Bounce from the force of your own counter |
| 5 | Gel Absorption | Active: one attack per cooldown is entirely absorbed for max Bounce |
| 6 | Spring Step | Spend minor Bounce for enhanced dodge distance |
| 7 | Rebound Body | After knockback, first action costs no Stamina |
| 8 | Advancement: Specialty feature |  |
| 9 | Flexible Body | Reduce body-region damage when Bounce is above 50% |
| 10 | Signature: Maximum Bounce | One encounter per session: full Bounce counter-attack that consumes all stored energy for devastating area impact |
| 11 | Limb Redirect | Detached limb can be used as improvised projectile spending Bounce |
| 12 | Capstone: Indestructible Moment | Once per encounter: take zero core Vitality damage for 3 seconds, build massive Bounce |

**Specialties:**
- **Sweet Science Boxer:** Precision hand techniques, Bounce from clean exchanges, technical counter
- **Taffy Wrestler:** Grapple focus, Bounce from sustained holds, stretch-and-bind mechanics
- **Rebounder:** Terrain-bounce mechanics, aerial rebounds, long-range Bounce attacks
- **Iron Gel:** Maximum body hardening, Bounce from simply existing in damage, tank-build

**Injury Fallback:** Arm loss activates dedicated headbutt and shoulder-ram replacements. Gummy Brawler is the class with the most designed injury adaptations.

**Exploration Utility:** Absorbing environmental impacts, bouncing over obstacles, breaking brittle terrain.

---

## 8. Gelomancer

**Resource:** Gel Reserve
**Resource Loop:** Gel Reserve represents accessible manipulable gel energy. Actions that use gel (shaping, healing, constructing) draw from the Reserve. Reserve restores through meditation-adjacent stillness, Sugar Well proximity, and specific abilities. Overextending Reserve causes physical backlash.

**Identity:** The Gelomancer manipulates the fundamental material of the world directly. They can shape their own body, shape others' bodies (allies and enemies), build constructs, and heal. Their power is direct and physical rather than elemental.

**Party Role:** Support/healer, crowd control, construct deployer
**Solo Viability:** Medium-High — healing sustain, but Reserve limits sustained output
**PvP Counterplay:** Reserve depletion through pressure. Silencing abilities. Anti-gel wards.

### Level 1–12 Feature Table

| Level | Feature | Description |
|-------|---------|-------------|
| 1 | Gel Shape | Minor body manipulation: extend/compress limbs briefly |
| 1 | Mend | Spend Gel Reserve to restore body-region integrity on ally |
| 2 | Gel Pull | Attract separated limbs from longer range (own or ally) |
| 3 | Specialty Selection | Choose Fleshshaper, Mender, Fusionist, or Construct Caller |
| 4 | Advancement: Extended Reserve | Reserve pool increases; Reserve backlash threshold raised |
| 5 | Harden | Apply temporary Crystal-Set properties to a body region |
| 6 | Destabilize | Reduce target's body-region structural cohesion |
| 7 | Gel Shield | Create a mobile gel barrier (degrades over hits) |
| 8 | Advancement: Specialty feature |  |
| 9 | Reserve Tap | Extract Gel Reserve from Sugar Lattice fragments in the environment |
| 10 | Signature: Reshape | Completely restructure an ally's body-region, removing all current deformation |
| 11 | Gel Web | Area ability: sticky gel field that restricts movement |
| 12 | Capstone: Master of Gel | Reserve regeneration in combat becomes possible; Mend efficiency doubles |

**Specialties:**
- **Fleshshaper:** Offensive body manipulation, destabilization, enemy limb control
- **Mender:** Healing focus, revive mechanics, body-region restoration
- **Fusionist:** Temporary body merging (ally cooperation abilities), shared resource pooling
- **Construct Caller:** Create and command gel constructs for combat assistance

**Injury Fallback:** Gelomancers can partially self-repair mid-combat using Reserve. Injury reduces but does not eliminate effectiveness.

**Exploration Utility:** Creating bridges, plugging gaps, repairing structures, moving objects via gel extension.

---

## 9. Flavorweaver

**Resource:** Flavor Charges
**Resource Loop:** Flavor Charges are stockpiled elemental energy. The Flavorweaver's equipped flavor combination determines which charge types are available. Charges build through actions that resonate with the character's flavor affinities and spend on elemental abilities. Charges can be held between encounters.

**Identity:** The Flavorweaver wields the world's fundamental elemental energies — the flavors that are also physical forces. Their abilities are precise elemental applications, not brute force.

**Party Role:** Elemental DPS, status application, environmental interaction
**Solo Viability:** Medium-High — versatile but requires planning
**PvP Counterplay:** Building resistance to the Flavorweaver's dominant flavor; ward use.

### Level 1–12 Feature Table

| Level | Feature | Description |
|-------|---------|-------------|
| 1 | Charge Read | Gain Flavor Charges from environmental flavor sources and affinity resonance |
| 1 | Flavor Strike | Spend a charge to add elemental damage to a physical attack |
| 2 | Affinity Read | Identify targets' flavor weaknesses passively |
| 3 | Specialty Selection | Choose Elementalist, Sugar Sage, Wrapperbound, or Chronocook |
| 4 | Advancement: Charge Capacity | Maximum charges increase; second flavor affinity accessible |
| 5 | Flavor Blend | Combine two charge types for hybrid elemental effects |
| 6 | Elemental Resistance | Use charges to temporarily resist incoming elemental damage |
| 7 | Status Infuse | Apply a flavor-specific status effect with charge spend |
| 8 | Advancement: Specialty feature |  |
| 9 | Charge Leech | Drain elemental energy from environmental sources mid-combat |
| 10 | Signature: Pure Flavor | One ability that removes all resistances for one flavor type on one target |
| 11 | Elemental Feedback | Targets that resist your flavor generate charges (overcharge from resistance) |
| 12 | Capstone: Flavor Mastery | Maximum charges always full; flavor blend costs reduced by half |

**Specialties:**
- **Elementalist:** Raw elemental damage focus, massive single-flavor output
- **Sugar Sage:** Healing-adjacent flavor use, Sugar-type buffs and restoration
- **Wrapperbound:** Dimensional flavor use, Wrapperborn-resonant abilities, fold-space interactions
- **Chronocook:** Flavor-timing mechanics, delayed charge detonation, ritual preparation

**Injury Fallback:** Flavor abilities do not require physical limbs in the same way. Some casting gestures affected by arm injury, but most Charge abilities remain functional.

**Exploration Utility:** Environmental flavor identification, elemental obstacle navigation, temperature manipulation.

---

## 10. Confectioner

**Resource:** Ingredients
**Resource Loop:** The Confectioner maintains a supply of Ingredients — physical material components harvested from monsters, environments, and vendors. Abilities spend specific ingredient types. Ingredient management between and during combat is the primary skill expression.

**Identity:** The Confectioner is a battlefield alchemist. They prepare, adapt, and deploy based on what materials they have. No two Confectioner encounters are identical because the materials available are never identical.

**Party Role:** Utility, debuff application, consumable support
**Solo Viability:** Medium — requires material investment between encounters
**PvP Counterplay:** Resource denial, preventing ingredient recovery, timing pressure.

### Level 1–12 Feature Table

| Level | Feature | Description |
|-------|---------|-------------|
| 1 | Harvest | Extract Ingredients from defeated monsters or environment |
| 1 | Quick Mix | Combine ingredients on the fly for minor effect (accuracy varies) |
| 2 | Field Recipe | Prepared recipe uses ingredients for reliable specific output |
| 3 | Specialty Selection | Choose Battlefield Chef, Apothecandy, Sour Brewer, or Mutagenist |
| 4 | Advancement: Recipe Memory | Carry more prepared recipes; Quick Mix reliability improves |
| 5 | Efficient Harvest | Passive: more ingredients per harvest action |
| 6 | Throw | Deliver ingredient-based effects at range |
| 7 | Overdose | Spend double ingredients for significantly enhanced effect |
| 8 | Advancement: Specialty feature |  |
| 9 | Scavenge | During combat: extract minor ingredient from damaged target |
| 10 | Signature: Master Recipe | One-time prepared recipe per encounter that can perfectly counter current enemy type |
| 11 | Adaptive Blend | Mid-combat recipe substitution (swap one ingredient type for available alternative) |
| 12 | Capstone: Full Larder | Ingredients never reach zero during combat (minimum 1 of each carried type always available) |

**Specialties:**
- **Battlefield Chef:** Food/cooking focus, Vitality restoration, sustained combat buffing
- **Apothecandy:** Medical focus, status cure, precise body-region treatment
- **Sour Brewer:** Debuff focus, Sour-type status applications, crowd control
- **Mutagenist:** Transformation effects, temporary composition changes, experimental applications

**Injury Fallback:** Some recipe actions require two hands. Dedicated one-hand recipe variants exist. Harvesting is the most affected.

**Exploration Utility:** Identifying plants and monster materials, environmental chemistry, barrier dissolution.

---

## 11. Candy Artificer

**Resource:** Capacity
**Resource Loop:** Capacity represents how many active constructs, devices, and systems the Artificer can maintain simultaneously. Deploying a turret, device, or mechanism uses Capacity. Recalling or destroying a device restores Capacity. Capacity does not regenerate passively — management is the resource loop.

**Identity:** The Candy Artificer does not fight alone. They fight with everything they've built. An Artificer battlefield is a prepared environment: turrets, mechanisms, trigger lines, and constructed allies making the space hostile to enemies and safe for the party.

**Party Role:** Control, sustained damage through constructs, battlefield preparation
**Solo Viability:** Medium — effective given preparation time
**PvP Counterplay:** Construct destruction, anti-device abilities, forcing fights in unprepped locations.

### Level 1–12 Feature Table

| Level | Feature | Description |
|-------|---------|-------------|
| 1 | Basic Turret | Deploy a stationary attacking construct (uses 1 Capacity) |
| 1 | Overclock | Temporarily boost a deployed construct beyond normal output |
| 2 | Device Crafting | Create field devices (trigger-based mechanisms) |
| 3 | Specialty Selection | Choose Turretwright, Demolitionist, Gearrider, or Dollmaker |
| 4 | Advancement: Expanded Capacity | Maximum Capacity increases |
| 5 | Maintenance | Passive: deployed constructs degrade more slowly |
| 6 | Remote Detonate | Destroy an owned construct at range for an explosion |
| 7 | Construct Link | Two constructs coordinate actions when within range of each other |
| 8 | Advancement: Specialty feature |  |
| 9 | Emergency Protocol | Damaged construct auto-detonates as a defensive measure |
| 10 | Signature: Full Deployment | All Capacity slots filled simultaneously with pre-configured loadout |
| 11 | Adaptive Construct | Construct type changes mid-combat to respond to enemy composition |
| 12 | Capstone: Living Workshop | Battlefield becomes self-sustaining — fallen constructs contribute material to others |

**Specialties:**
- **Turretwright:** Turret optimization, area coverage, sustained construct damage
- **Demolitionist:** Explosive devices, area destruction, terrain modification
- **Gearrider:** Mobile construct as mount/vehicle, movement-based Artificer
- **Dollmaker:** Companion-style constructs, AI-direction, advanced coordination

**Injury Fallback:** Artificer can direct constructs verbally (PROPOSED) when limb injury prevents manual operation. Some construction actions require injury accommodation.

**Exploration Utility:** Creating bridges, mechanisms, elevators, and structural modifications.

---

## 12. Syrupwarden

**Resource:** Conviction
**Resource Loop:** Conviction builds through actions that embody the Warden's oath — protecting the vulnerable, holding ground under duress, or retributive action against oath-breakers. Conviction enables enhanced defensive abilities and oath-driven burst powers.

**Identity:** The Syrupwarden is a paladin-equivalent: a character whose power flows from their beliefs. The specific Oath determines what actions build Conviction and what abilities it enables. A Warden who acts against their oath does not just lose standing — they lose access to their resource.

**Party Role:** Tank, support, moral compass of the party
**Solo Viability:** Medium — strong sustained, but Conviction requires oath-aligned play
**PvP Counterplay:** Oath violation opportunities, forcing situations that conflict with the Oath.

### Level 1–12 Feature Table

| Level | Feature | Description |
|-------|---------|-------------|
| 1 | Oath | Select and bind to an Oath at class creation |
| 1 | Conviction Build | Oath-aligned actions build Conviction |
| 2 | Ward Channel | Spend Conviction to place protective Wards on allies |
| 3 | Specialty Selection | Choose Oath of the Unbroken, Oath of the Lantern, Oath of Retribution, or Oath of the Free Pour |
| 4 | Advancement: Oath Deepening | Conviction maximum increases; oath builds at faster rate |
| 5 | Aura | Passive: presence within range grants minor benefits to oath-aligned allies |
| 6 | Oath Strike | Conviction-spending attack that carries oath-resonant damage type |
| 7 | Ward Expansion | Wards maintained simultaneously increase |
| 8 | Advancement: Specialty feature |  |
| 9 | Unshaken | Passive: Conviction loss from minor oath violations is halved |
| 10 | Signature: Moment of Conviction | Full Conviction burst: one overwhelming oath-aligned action |
| 11 | Inspiring Presence | Ally Stamina recovery rate improves in Warden's presence |
| 12 | Capstone: Living Oath | Conviction no longer decays passively; oath-aligned death is impossible while Conviction > 0 |

**Specialties (Oath-based):**
- **Oath of the Unbroken:** Defensive oath, protection, damage absorption for allies
- **Oath of the Lantern:** Guidance oath, illumination abilities, detection, clearing dark areas
- **Oath of Retribution:** Revenge oath, scales Conviction with damage taken, punishing burst
- **Oath of the Free Pour:** Liberation oath, oath against tyranny, conviction from freeing prisoners/binding broken entities

**Injury Fallback:** Conviction-based abilities are not physically limb-dependent. Physical combat actions adapt as per Edgebearer injury rules.

**Exploration Utility:** Ward placement for area protection, ethical dialogue options, sanctuary creation.

---

## 13. Candysinger

**Resource:** Tempo
**Resource Loop:** Tempo builds and decays based on the rhythm of combat. Regular, well-timed actions build Tempo; missed beats, stagger, or silence reduce it. High Tempo enables powerful Tempo abilities; maintaining Tempo is a skill expression of consistent execution.

**Identity:** The Candysinger is a performance fighter. They establish a rhythm — a pattern of actions — and maintain it under pressure. They also project that rhythm to allies (buffing) and enemies (disrupting). Music as combat system.

**Party Role:** Buffer, debuffer, tempo management, morale specialist
**Solo Viability:** Medium — less effective without party to benefit from buffs
**PvP Counterplay:** Rhythm disruption, Silence status, stagger chains.

### Level 1–12 Feature Table

| Level | Feature | Description |
|-------|---------|-------------|
| 1 | Beat | Every consistent action on the beat builds Tempo |
| 1 | Inspire | Spend Tempo to grant an ally a Tempo-resonant buff |
| 2 | Dissonance | Off-beat ability that disrupts enemy Tempo/rhythm |
| 3 | Specialty Selection | Choose War Drummer, Sweetblade Dancer, Storykeeper, or Discordant |
| 4 | Advancement: Extended Tempo | Maximum Tempo increases; Tempo decay slows |
| 5 | Harmony | When two party members act on the same beat, double Tempo builds |
| 6 | Counter-Rhythm | Absorb a disruption attempt and convert it to Tempo |
| 7 | Battle Song | Extended Tempo ability that buffs the entire party for duration |
| 8 | Advancement: Specialty feature |  |
| 9 | Tempo Transfer | Give Tempo to an ally |
| 10 | Signature: Perfect Beat | One sequence per encounter where all actions auto-succeed their timing windows |
| 11 | Anthem | The highest available Tempo buff; area effect, all allies |
| 12 | Capstone: Living Song | Tempo never resets between rounds; party maintains accumulated Tempo |

**Specialties:**
- **War Drummer:** Physical Tempo expression, rhythm-based attacks, percussion damage
- **Sweetblade Dancer:** Dance/weapon fusion, Tempo from choreographed movement sequences
- **Storykeeper:** Narrative abilities, lore-based combat bonuses, storytelling as buff
- **Discordant:** Enemy rhythm disruption, Silence application, anti-caster specialty

**Injury Fallback:** Voice-based abilities unaffected by limb injury. Physical instrument use adapts. Sweetblade Dancer has the highest injury sensitivity.

**Exploration Utility:** Musical communication, unlocking melody-gated areas, morale restoration at camp.

---

## 14. Class Synergies

**Status: PROPOSED**

Selected notable synergy pairs:

| Class A | Class B | Synergy |
|---------|---------|---------|
| Edgebearer | Skewer | Formation combat: Edge Alignment from Skewer's Pin assist |
| Pinshot | Edgebearer | Edge Alignment spent for guaranteed Pin detonation position |
| Crusher | Gummy Brawler | Cascade knockback: Crusher launches, Brawler Bounces off impact |
| Gelomancer | Candy Artificer | Construct repair: Gel Reserve maintains Artificer devices |
| Flavorweaver | Pinshot | Flavor marks detonated by Pinshot Mark Detonate |
| Syrupwarden | Candysinger | Conviction-Tempo resonance: synchronized beats build both resources |
| Confectioner | Gelomancer | Ingredient-gel interaction: harvested gel materials refresh Reserve |
| Licorice Rogue | Pinshot | Advantage from Mark placement; Pin as Advantage setup |

Full synergy documentation will be expanded during class implementation phase.

---

## 15. Progression Overview

| Level | Feature Type | All Classes |
|-------|-------------|------------|
| 1 | Core abilities | 2 core abilities available |
| 3 | Specialty | Choose specialty |
| 4 | Advancement | First specialty advancement |
| 5 | Passive | Class passive unlocks |
| 6 | Active | New active ability |
| 7 | Advanced active | Technique-gated ability |
| 8 | Advancement | Second specialty advancement |
| 9 | Passive | Enhanced passive |
| 10 | Signature | Signature ability |
| 11 | Capstone setup | Pre-capstone feature |
| 12 | Capstone | Capstone ability |

*Full ability details per class to be developed in individual class design documents. Above is the template framework.*

*Last updated: 2026-08-02*
