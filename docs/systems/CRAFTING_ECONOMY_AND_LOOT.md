# Crafting, Economy, and Loot

> **Status:** VERIFIED framework with PROPOSED tuning values
> **Canonical scope:** Crafting, repair, recasting, currencies, trading, loot provenance, economic controls, and reward integrity

## Purpose

GUMFALL uses a source-grounded economy. Items should come from believable
creatures, factions, workshops, treasuries, environments, and activities rather
than from arbitrary player-level scaling.

The system must support:

- Understandable item origins
- Long-term equipment identity
- Regional and faction economies
- Useful crafting without invalidating exploration
- Repair and maintenance without punitive busywork
- Fair trading
- Economic sinks and faucets
- PvP risk without irreversible equipped-item theft
- Auditable item provenance
- No pay-to-win progression

## Design principles

1. **Source before level.** A bronze soldier carries bronze equipment even when
   encountered by a high-level player.
2. **Materials have behavior.** Material choice affects mass, articulation,
   durability, temperature response, Ward capacity, and damage interaction.
3. **Crafting complements discovery.** Crafted gear and found gear remain
   valuable for different reasons.
4. **Condition matters without destroying identity.** Equipment can wear,
   deform, and require skilled repair, but ordinary use should not erase a
   character-defining item.
5. **Provenance is persistent.** Significant creation, ownership, repair,
   enchantment, and victory events become part of an item's history.
6. **Currency needs sinks.** Every major currency faucet must have corresponding
   maintenance, crafting, social, cosmetic, access, or service sinks.
7. **No hidden extraction.** Costs, risks, bind rules, repair outcomes, and
   conversion rates are disclosed before confirmation.
8. **No paid power.** Levels, XP, Legacy points, Apex Proofs, Trial completion,
   Malady, best-in-slot power, and competitive advantages are not sold.

## Item identity

Every durable item is defined by:

- Form
- Material
- Construction
- Craftsmanship
- Condition
- Provenance
- Required proficiency
- Body-region or equipment-slot compatibility
- Optional enchantments
- Optional Wards
- Binding state
- Repair history

### Craftsmanship tiers

- Crude
- Common
- Tempered
- Masterwork
- Relic
- Mythic

Craftsmanship influences consistency, durability, articulation, repair tolerance,
and available modification quality. It does not permit an inappropriate base
material to ignore its physical limitations.

## Material progression

Representative public progression bands:

| Levels | Common material access |
|---|---|
| 1–10 | Natural materials, copper, bronze |
| 11–20 | Bronze and iron |
| 21–35 | Steel, chain, early plate |
| 36–50 | Tempered steel and advanced monster materials |
| 51–65 | Mithril and silversteel |
| 66–75 | Adamantine, orichalcum, platinum alloy |
| 76–85 | Iridium and composite materials |
| 86–95 | Aetherium and Prismatic Sugarsteel |
| 96–99 | Mythic and singular materials |
| 100 | Transcendent artifacts |

These are access bands, not universal replacement rules. Lower-tier materials
remain useful through weight, flexibility, availability, repairability, cultural
value, special construction, and specific physical interactions.

## Crafting disciplines

### Smithing and metalwork

Produces and maintains:

- Blades
- Polearms
- Hammers
- Shields
- Chain
- Plate
- Articulated armor
- Mechanical fittings
- Prosthetic structures

### Gelworking

Produces and maintains:

- Reattachment compounds
- Sugar resin
- Body-safe adhesives
- Flexible armor interfaces
- Prosthetic sockets
- Regeneration supports
- Composition-sensitive linings

### Confectionery

Produces:

- Food
- Combat meals
- Recovery supplies
- Flavor infusions
- Temporary resistance mixtures
- Field preparation kits
- Alchemical candy compounds

### Artificing

Produces:

- Turrets
- Traps
- Ammunition
- Mechanical candy devices
- Vehicles and mobility devices
- Deployable tools
- Repair instruments

### Wrappercraft

Produces:

- Flexible protection
- Carrying systems
- Seals
- Insulation
- Magical inscription surfaces
- Ward-compatible layers

### Monstercraft

Uses ethically and legally acquired monster materials to create:

- Armor
- Weapons
- Linings
- Catalysts
- Trophies
- Specialized tools
- Region-specific equipment

Monster materials must remain tied to anatomy and ecology.

## Recipe structure

A recipe defines:

- Output form
- Required materials
- Permitted substitutions
- Required tools
- Required facility
- Crafting discipline
- Proficiency threshold
- Time
- Currency or service cost
- Failure boundaries
- Quality influences
- Provenance entry
- Salvage result

Recipes may be learned through:

- Training
- Faction reputation
- Exploration
- Monster Knowledge
- Royal court blueprints
- Quest rewards
- Reverse engineering
- Experimentation
- Legacy preservation after Reroll

Exact protected royal recipes and unreleased formulas remain outside the public
repository.

## Crafting outcomes

Crafting should not rely on destructive random failure for ordinary recipes.

Possible outcomes:

- Valid standard item
- Higher craftsmanship when requirements are exceeded
- Material-efficient result
- Specialized property
- Cosmetic maker signature
- Recoverable flawed result for risky experimental work

A failed ordinary craft should normally return salvage rather than erase all
materials.

## Enchantment crafting boundaries

- Skilled crafters may intentionally add one enchantment.
- Masters may create two-enchantment items.
- Three-enchantment items are world, royal, or relic outcomes.
- Malady cannot be crafted, duplicated, rerolled, or expanded.
- A fifth enchantment is not permitted.
- Malady repair requires an appropriate master.
- Natural enchantments and crafted enchantments must have distinct provenance.

## Wards

Armor and wrapper crafting may apply Wards according to:

- Material
- Construction
- Coverage
- Craftsmanship
- Available Ward capacity
- Crafter skill
- Required catalysts

Ordinary Wards reduce matching buildup, duration, or secondary effects. They do
not create unconditional immunity.

## Repair

Repair restores function within material and construction limits.

Repair considers:

- Current condition
- Missing material
- Deformation
- Structural cracks
- Articulation
- Enchantment stability
- Ward integrity
- Previous repairs
- Available replacement materials
- Crafter proficiency

### Repair outcomes

- Field repair: restores limited function
- Workshop repair: restores normal service condition
- Master restoration: addresses severe or rare damage
- Reforging: changes construction while preserving declared provenance
- Relic restoration: bespoke quest or specialist process

Ordinary repair must not silently downgrade craftsmanship, remove enchantments,
replace materials, or erase provenance.

## Recasting

Recasting restores the character's essential body at a Sugar Well or approved
restoration point.

Recasting can:

- Restore lost limbs
- Restore damaged body regions
- Clear eligible embedded objects
- Re-establish safe baseline body condition
- Return the character to play

Recasting does not automatically repair all equipment. It must not duplicate
items, currency, materials, or detached body parts.

## Salvage

Salvage converts damaged or obsolete items into recoverable resources.

Salvage output depends on:

- Material mass
- Condition
- Construction
- Craftsmanship
- Embedded components
- Enchantment status
- Ward status
- Contamination
- Provenance restrictions

Bound quest items and protected artifacts require explicit special handling.

## Currency

The base-ten public metal standard is:

1. Tin Bit
2. Copper Link
3. Bronze Mark
4. Silver Shield
5. Electrum Sun
6. Gold Crown
7. Platinum Seal
8. Iridium Star
9. Aetherium Prism

Special currencies include:

- Guild Laurels
- Arena Crests
- Wrapper Sigils
- Faction Scrip
- Monster Cores

Special currencies should have clear sources, spending categories, caps where
needed, and anti-stockpiling rules. Conversion into general currency should be
limited or unavailable when it would undermine activity identity.

## Economic faucets

Representative faucets:

- Quests
- Monster bounties
- Source-grounded item drops
- Salvage
- Trade
- Royal treasury rewards
- Arena rewards
- Tournament rewards
- Faction contracts
- Exploration caches
- Crafting commissions

## Economic sinks

Representative sinks:

- Repair
- Crafting services
- Material processing
- Travel
- Storage
- Market listing
- Guild facilities
- Housing and cosmetics
- Tournament hosting
- Arena registration
- Recasting services where appropriate
- Faction services
- Blueprint research
- Item appraisal
- Provenance certification

Sinks must remain understandable and should not make basic participation
unaffordable.

## Loot generation

Loot generation begins with the source.

A loot source defines:

- Creature, faction, container, workshop, treasury, or activity
- Region
- Equipment actually carried
- Materials actually present
- Rank
- Craftsmanship range
- Condition range
- Currency access
- Recipe access
- Enchantment eligibility
- Ward eligibility
- Unique provenance events

### Source-grounded examples

- A Bronze Paw soldier may drop bronze equipment, faction supplies, currency,
  orders, and region-appropriate materials.
- A Sugar Wolf may provide anatomy-grounded monster materials rather than forged
  weapons.
- A royal forge may provide court blueprints, masterwork equipment, royal
  materials, and rare natural-enchantment opportunities.
- An arena reward chest provides declared event rewards rather than the defeated
  contestant's equipped items.

## Loot ownership

Loot allocation modes may include:

- Personal loot
- Party roll
- Assigned party loot
- Shared materials
- Event escrow
- Guild distribution

The selected rule is disclosed before the activity begins. Host-controlled events
must escrow rewards and rules before registration closes.

## Item provenance

Each significant item may record:

- Creation source
- Creator
- Material sources
- Original owner
- Ownership transfers
- Major repairs
- Reforging
- Enchantment events
- Ward events
- Named victories
- Royal court origin
- Tournament record
- Malady defeat record
- Audit state

Provenance should be signed or server-validated for competitive and high-value
items.

## Trading

Trading may support:

- Direct player trade
- Market listings
- Crafting commissions
- Guild exchange
- Faction exchange
- Auction or bid systems where approved

Trading rules must disclose:

- Fees
- Taxes
- Binding
- Listing duration
- Cancellation
- Delivery
- Provenance
- Item condition
- Repair state
- Enchantments
- Wards

## Binding

Possible binding states:

- Unbound
- Account-bound
- Character-bound
- Quest-bound
- Temporary activity lock
- Legacy Vault lock

Binding exists for progression integrity, narrative identity, fraud prevention,
and activity balance—not to force unnecessary duplicate purchases.

## Legacy Vault

After a Reroll, equipment above current proficiency moves to the Legacy Vault.

The vault preserves:

- Item identity
- Condition
- Provenance
- Enchantments
- Wards
- Cosmetic state

The item becomes usable again when proficiency requirements are regained.

## Shattercrown risk pouch

Shattercrown uses an explicit Risk Pouch.

Eligible risk may include:

- Declared loose currency
- Declared gathered materials
- Declared unbound loot
- Bounty value

Never at risk:

- Equipped bound gear
- Permanent progression
- Legacy points
- Paid cosmetics
- Essential quest items
- Protected accessibility configuration

Entry presents the risk rules before consent. Extraction secures eligible pouch
contents.

## Inflation controls

The economy may use:

- Progressive market fees
- Repair and service sinks
- Currency caps on selected activities
- Reduced rewards from trivial content
- Anti-bot and anti-duplication audit
- Item provenance
- Seasonal cosmetic sinks
- High-end hosting costs
- Material processing loss
- Dynamic but bounded NPC demand
- Quarantine of suspicious currency or items

Inflation control must never silently delete legitimate player wealth.

## Duplication and fraud response

The server records:

- Creation event
- Item identifier
- Currency ledger event
- Trade event
- Market event
- Crafting event
- Salvage event
- Loot award event
- Rollback lineage

Suspicious assets may be quarantined while preserving an audit trail. Rollback
must avoid punishing unrelated recipients when evidence is incomplete.

## PvP and competitive integrity

Structured PvP does not award an opponent's equipped items.

Open-progression modes may award:

- Prestige
- Currency
- Declared materials
- Cosmetics
- Titles
- Bounties
- Risk-pouch contents

Ranked rewards must not create an exclusive power loop that makes future ranked
competition inaccessible.

## Ethical monetization boundary

Do not sell:

- XP
- Levels
- Legacy points
- Apex Proofs
- Trial completion
- Malady
- Best-in-slot power
- Ranked advantages
- Hidden-level access
- Loot-roll manipulation
- Repair outcomes
- Provenance forgery

Permitted concepts may include cosmetics, emotes, housing cosmetics, mount
appearances, noncompetitive effects, expansions, and clearly described supporter
packs.

## Required data contracts

Future technology-neutral schemas should cover:

- Item
- Material
- Recipe
- Crafting event
- Repair event
- Salvage event
- Currency ledger event
- Loot source
- Loot award
- Trade
- Market listing
- Binding state
- Item provenance
- Risk pouch

## Validation and QA

Required tests include:

- Currency conservation
- Duplicate item detection
- Recipe input/output integrity
- Repair preservation
- Salvage bounds
- Binding transitions
- Legacy Vault transitions
- Source-grounded loot rules
- Enchantment eligibility
- Ward capacity
- Market fee calculation
- Trade cancellation
- Event escrow
- Shattercrown extraction
- Rollback and quarantine
- Save migration
- Audit replay

## Open decisions

- **UNKNOWN:** Final NPC vendor spread
- **UNKNOWN:** Final market listing fee formula
- **UNKNOWN:** Which special currencies are account-bound
- **UNKNOWN:** Ordinary Recasting service cost
- **UNKNOWN:** Exact repair degradation thresholds
- **UNKNOWN:** Final high-tier material-processing loss
- **UNKNOWN:** Regional taxation and faction tariffs
- **UNKNOWN:** Final auction design
- **UNKNOWN:** Player-created shop support

These decisions require economy simulation and playtesting. No production
economic tuning has been performed.
