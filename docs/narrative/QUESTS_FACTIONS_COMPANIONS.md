# GUMFALL — Quests, Factions, and Companions
**Status:** PROPOSED throughout — all faction/companion/quest details require narrative owner approval
**Cross-references:** [Premise and Tone](PREMISE_AND_TONE.md) · [Progression](../systems/PROGRESSION.md) · [Character Creation](../game-design/CHARACTER_CREATION.md) · [Monster System](../systems/MONSTER_SYSTEM.md)

---

## 1. Quest Taxonomy

GUMFALL uses a layered quest architecture. All quests exist within a persistent world state that tracks player choices and faction relationships.

### 1.1 Main Quest (MQ)

The primary narrative throughline. Follows the investigation of the Shattering — its cause, its perpetrators, and the question of whether the Sugar Lattice can be restored. Main Quest quests gate major narrative revelations and world-state changes.

**Design Rules:**
- Main Quest quests must be completable regardless of faction alignment.
- Faction alignment changes *how* some MQ quests are approached, not *whether* they can be completed.
- MQ quests should not require specific class or lineage.
- MQ completion unlocks the endgame choice sequence.
- MQ is gated by overall level progression (see [Progression](../systems/PROGRESSION.md)), not arbitrary locks.

**Quest Structure:** MQ quests use a chapter structure (PROPOSED: 4–6 chapters, each containing 3–6 quests). Chapter breaks are marked by significant world-state changes.

### 1.2 Regional Arc Quests (RA)

Each major world region has its own arc — a self-contained story that nevertheless connects to the broader main conflict. Regional arcs are optional but provide significant XP, faction standing, and world lore.

**Design Rules:**
- Regional arcs should be completable in any order.
- Regional arcs may lock out certain options depending on prior faction choices.
- Completing a regional arc changes the political state of that region.
- Regional arcs should each have at least one major boss encounter.

### 1.3 Faction Quests (FQ)

Dedicated quest lines for each of the five PROPOSED factions. Faction quests advance faction standing and unlock faction-specific rewards, companions, and abilities.

**Design Rules:**
- Faction quests become unavailable (or adversarial) if faction standing drops below threshold.
- Players can maintain neutral standing with all factions through careful choices.
- Some faction quests are mutually exclusive — completing one permanently locks out the opposing faction's equivalent quest.
- Faction quest completion is tracked in the world state and affects NPC dialogue.

### 1.4 Companion Quests (CQ)

Personal story quests for each recruited companion. Companion quests deepen companion relationships and unlock companion-specific abilities or equipment.

**Design Rules:**
- Companion quests become available after a relationship threshold is met.
- Companion quests may involve moral choices that affect the companion's behavior going forward.
- Companion quests are entirely optional but affect companion survivability in late game (PROPOSED: companions without completed quests may not survive certain endgame events).
- Companion quests may be mutually supportive or in tension (e.g., two companions with opposing goals).

### 1.5 Dungeon Quests (DQ)

Structured quests tied to specific dungeon locations. These include the Royal Courts, hidden rooms, and special locations.

**Design Rules:**
- Dungeon quests have explicit entry requirements (level, key item, faction standing).
- Dungeon quests have failure states that result in ejection from the dungeon (not permanent failure).
- Dungeon quests are repeatable at lower reward after first completion.
- **IMPORTANT:** Dungeon quest solutions, maze layouts, and Royal Court sovereign-specific answers are not documented in public-facing design files. See governance boundaries.

### 1.6 Daily and Event Quests (DE)

Rotating limited-time content including world events, arena events, and seasonal content.

**Design Rules:**
- Daily quests must be completable in under 30 minutes (PROPOSED: target 15–20 minutes).
- Event quests have explicit start/end dates in UI.
- Event quest rewards must not be best-in-slot — exclusive cosmetics and event currency only.
- Daily/event content does not affect main quest progression.

---

## 2. Quest Structure Template

Every quest in GUMFALL uses the following structural template. Individual quests elaborate on this template; none omit it.

```
QUEST ID: [MQ/RA/FQ/CQ/DQ/DE]-[REGION]-[NUMBER]
QUEST NAME: [Title]
QUEST TYPE: [Category]
LEVEL RANGE: [Min–Max]
FACTION REQUIREMENT: [None / Faction name at Standing X]
PREREQUISITE QUESTS: [List or None]

SUMMARY:
[2–3 sentence summary of the quest's narrative and gameplay content]

OBJECTIVES:
  Primary:
    1. [Objective description]
    2. [Objective description]
  Optional:
    1. [Optional objective and reward]

NARRATIVE BRANCHES:
  Branch A: [Condition → Outcome]
  Branch B: [Condition → Outcome]

FAILURE STATES:
  - [Condition that causes quest failure]
  - [Condition that causes quest failure]

FAILURE CONSEQUENCE:
  [What happens after failure — retry available? World state change?]

COMPLETION REWARDS:
  - XP: [Amount]
  - Currency: [Type and amount]
  - Items: [Specific or category]
  - Faction Standing: [Faction ±amount]
  - World State Change: [Description or None]

DESIGNER NOTES:
  [Internal notes about intent, tricky edge cases, and playtesting flags]
```

---

## 3. Faction Roster

**Status: PROPOSED — all factions require owner approval**

### 3.1 The Crown Accord

**Core Identity:** A coalition of surviving royal houses, noble families, and military commanders who believe the pre-Shattering political order was legitimate and must be restored.

**Philosophy:** The world was stable because it had structure — hierarchical, territorial, codified. The Shattering proved that structure was necessary. The solution is reconstruction of that structure, with the rightful ruling families restored to their rightful fragments.

**Internal Conflicts:**
- Monarchist hardliners (restore everything as it was) vs. reformist nobles (restore order but modernize it)
- Power struggles between surviving royal houses over which fragment belongs to which crown
- Tension with military commanders who have effective power but lack noble legitimacy

**NPC Types:**
- Court heralds and diplomats
- Noble house guards and knights
- Displaced aristocratic families living in camps with their household goods
- Royal historians (often also Memory Keepers)
- Crown Accord military commanders (Sugar Guard veterans)

**Rewards:**
- Access to pre-Shattering equipment caches (higher-quality craftsmanship items)
- Noble title (cosmetic, affects NPC dialogue)
- Guard captain companions
- Political intelligence on Royal Courts

**Alignment Spectrum:** Not uniformly sympathetic or villainous. Individual Crown Accord members range from genuine protectors of stability to landed gentry protecting privilege.

**Faction Standing Levels:** Outsider → Known → Trusted → Agent → Knight → Champion of the Accord

---

### 3.2 The Free Pour

**Core Identity:** A populist, anti-royalist movement drawn from displaced commoners, freed workers, and political radicals who see the Shattering as an opportunity to build something better than what existed before.

**Philosophy:** The old world was held together by the Sugar Lattice, yes — but the Sugar Lattice was controlled by the wealthy. The Shattering revealed that the so-called natural order was maintained by deliberate exclusion. The new world should belong to everyone.

**Internal Conflicts:**
- Egalitarian democrats vs. populist demagogues
- Pacifist organizers vs. revolutionary militants
- Ideological disagreement about whether the Lattice should be restored (restoring it might restore the old power structures)
- Tension with factions the Free Pour needs as allies but cannot fully trust

**NPC Types:**
- Commoner organizers and community leaders
- Former Arena survivors turned fighters-for-hire
- Idealistic young adventurers
- Cynical ex-Sugar Guard who switched sides
- Caravan runners and traders who built their own networks

**Rewards:**
- Community resource access (low-cost crafting materials)
- Safe passage through Free Pour-controlled fragments
- Populist reputation (affects dialogue with commoner NPCs significantly)
- Unique weapon modifications (improvised but effective)

**Alignment Spectrum:** From sincere egalitarians to opportunists using the movement for personal power. The movement has real grievances and real blindspots.

**Faction Standing Levels:** Stranger → Sympathizer → Participant → Organizer → Revolutionary → Voice of the Pour

---

### 3.3 The Gelwright Circle

**Core Identity:** A consortium of artificers, scientists, chemists, and Candy Artificers who believe the Shattering is a technical problem requiring a technical solution.

**Philosophy:** The Sugar Lattice is a physical structure. Physical structures can be studied, modeled, and repaired. The political factions fighting over the fragments are wasting resources that should be spent on reconstruction. The Gelwright Circle will fix the world — once everyone stops being in the way.

**Internal Conflicts:**
- Pure researchers vs. applied engineers
- Those who want to restore the original Lattice vs. those who want to rebuild it better
- Ethical debates about Recasting (using Gelomancy to forcibly reshape people — see [Body Integrity](../systems/BODY_INTEGRITY.md))
- Tension over who the Circle answers to — any patron, or only themselves

**NPC Types:**
- Candy Artificers and their creations
- Field researchers and specimen collectors
- Construct operators
- Gelomancer researchers (particularly Fusionists and Construct Callers)
- Technical writers and mappers

**Rewards:**
- Access to prototype equipment
- Artificer crafting schematics
- Gelwright Capacity upgrades for Candy Artificer class
- Research intelligence (world lore, monster knowledge)

**Alignment Spectrum:** Intellectually honest but often politically naïve. Individual members range from genuinely altruistic to dangerously arrogant about technical solutions to human problems.

**Faction Standing Levels:** Layperson → Associate → Researcher → Senior Researcher → Circle Member → Archwright

---

### 3.4 The Void Wrappers

**Core Identity:** A Wrapperborn extremist movement that treats the Shattering as a sacred revelation — proof that the world's dimensional structure was always a prison, and the correct response is to embrace permanent fracture.

**Philosophy:** The Sugar Lattice was a constraint. A cage. It enforced a single, fixed geography on a world that is naturally multi-dimensional. The Wrapperborn have always known there is more than one reality. The Shattering opened the seams. Repairing the Lattice is a desecration.

**Internal Conflicts:**
- Religious zealots vs. pragmatic separatists
- True believers vs. opportunists using the movement as cover for territorial expansion
- Moderates who want Wrapperborn autonomy vs. extremists who want everyone else to stay on their side of the Fold

**NPC Types:**
- Wrapperborn fold-priests
- Dimensional scouts and assassins
- True believer communities
- Refugees using Wrapperborn fold-zones as safe passage (not aligned with the Void Wrappers ideologically)

**Rewards:**
- Fold-access abilities (non-combat traversal shortcuts)
- Dimensional equipment (unique Wrapperborn material)
- Access to Folded Court political intelligence
- Unique Wrapperbound specialty abilities if player is Flavorweaver

**Alignment Spectrum:** From sincere spiritual belief to nihilistic violence. The movement has legitimate grievances about how Wrapperborn were treated under the old Lattice order, and has used those grievances to justify increasingly extreme positions.

**Faction Standing Levels:** Outsider → Observed → Tolerated → Initiate → Fold-Touched → Dimensional Sovereign

---

### 3.5 The Memory Keepers

**Core Identity:** A Staleborn-led organization dedicated to preserving knowledge, history, and cultural artifacts from the pre-Shattering world before they are lost, destroyed, or deliberately erased.

**Philosophy:** History is material. The old world existed. Its languages, art, political structures, and peoples existed. The Shattering is already erasing these things. Someone must preserve them, even if preservation cannot stop change.

**Internal Conflicts:**
- Archivists vs. activists (is preservation passive or must you defend it?)
- Tension over whether to share archived knowledge or keep it controlled
- Debate about whether preserving old power structures' history legitimizes them
- The existential crisis: the Memory Keepers themselves are Staleborn, and Staleborn are slowly crystallizing toward death. Who preserves the preservers?

**NPC Types:**
- Staleborn archivists and historians
- Non-Staleborn researchers and scholars
- Ruined-site guardians
- Oral historians and traveling storytellers
- Former nobles who care more about history than restoration

**Rewards:**
- Lore access and world knowledge (significant item and enemy knowledge unlocks)
- Historical equipment (pre-Shattering provenance items)
- Monster Knowledge advancement bonuses
- Unique Staleborn-culture items

**Alignment Spectrum:** Generally sympathetic, but the organization's commitment to neutrality sometimes means they do nothing while atrocities happen to protect their archives. Individual members are often heroic; the institution can be complicit.

**Faction Standing Levels:** Curious → Reader → Student → Keeper → Elder Keeper → Living Archive

---

## 4. Companion Roster

**Status: PROPOSED — all companions require narrative owner approval. Names are placeholders.**

### 4.1 Tutorial Companion — The One-Armed Soldier

**Placeholder Name:** Emberstem (PROPOSED, pending approval)
**Lineage:** Bearkin
**Composition:** Firm-Set
**Flavor Affinity:** Cherry Ember
**Class:** Edgebearer (Duelist specialty — adapted single-arm technique)
**Background:** Broken Veteran
**Faction:** Unaligned (former Sugar Guard, resigned)

**Physical Description:** A red Bearkin, medium-height, wearing battered bronze armor. Missing left arm — the stump is healed, the loss is old. Moves with the careful economy of someone who has recalibrated their center of gravity more than once.

**Personality:** Dry, patient, occasionally funny in a way that takes a second to land. Talks about catastrophic events with the same practical tone they use for mundane ones. Has not given up — has simply updated their priors about what is survivable.

**Story Arc (PROPOSED):** The soldier knows something about the night of the Shattering — not why it happened, but where they were and what they saw. This knowledge is the core of their companion quest. The arc explores: what do you do with information that is simultaneously useless and world-changing? What does it mean to have survived something that killed millions?

**Gameplay Function:**
- Primary tutorial guide (Levels 1–3)
- Combat advice for Edgebearer and physical combat players throughout
- Environmental commentary (former Sugar Guard means they've been everywhere)
- Party role: Off-tank / melee DPS

**Companion Quest Beat (PROPOSED):** The player discovers the soldier was present at a Lattice node when it fractured. The quest involves returning to that location (now a floating ruin), confronting what happened there, and choosing whether to share what was learned with any faction — each of which would use the information differently.

**Party Banter Notes:**
- References their missing arm matter-of-factly, never melodramatically
- Has strong opinions about armor maintenance
- Makes combat recommendations the player can follow or ignore
- Has an antagonistic-to-warm arc with the Gelwright Circle companion

---

### 4.2 The Gelwright Researcher

**Placeholder Name:** Crystallin (PROPOSED)
**Lineage:** Jellybean Folk
**Composition:** Crystal-Set
**Flavor Affinity:** Lemon Spark
**Class:** Candy Artificer (Turretwright specialty)
**Background:** Wrapper Scholar
**Faction:** The Gelwright Circle (Senior Researcher)

**Physical Description:** A compact Jellybean Folk with a Crystal-Set composition — slightly translucent, with visible internal structures. Carries an impractical amount of research equipment. Eyes move quickly and constantly.

**Personality:** Intensely curious, occasionally oblivious to social dynamics, genuinely kind in moments that matter. Talks faster when excited. Makes connections between things others miss.

**Story Arc (PROPOSED):** Has a theory about the Shattering's cause that their own Circle doesn't want them to pursue — because the theory implicates someone the Circle needs as a patron. The arc explores: what does intellectual integrity cost when institutions protect themselves at the expense of truth?

**Gameplay Function:**
- Crafting and equipment optimization advisor
- Turret deployment in combat
- Environmental analysis (identifies crafting materials, weaknesses in structures)
- Party role: Ranged DPS / Utility / Crafting support

---

### 4.3 The Free Pour Organizer

**Placeholder Name:** Tangle (PROPOSED)
**Lineage:** Wormkin
**Composition:** Soft-Set
**Flavor Affinity:** Lime Sour
**Class:** Licorice Rogue (Binder specialty)
**Background:** Street Molder
**Faction:** The Free Pour (Organizer)

**Physical Description:** A Wormkin — elongated, flexible, able to compress into narrow spaces. Soft-Set means visible deformation under impact. Scars from old encounters, worn openly as evidence.

**Personality:** Politically passionate without being hectoring. Has seen enough to be cynical about institutions and idealistic about individuals. Understands when to trust and when not to, usually correctly.

**Story Arc (PROPOSED):** A community the organizer built before the Shattering was destroyed during the event — not by the Shattering itself but by someone who used the chaos to settle old scores. The arc explores: what is justice in a world where the institutions that would administer justice have collapsed?

**Gameplay Function:**
- Social navigation and infiltration
- Trap deployment and crowd control
- Access to Free Pour safe houses and networks
- Party role: Controller / Skirmisher

---

### 4.4 The Staleborn Archivist

**Placeholder Name:** Aldrim (PROPOSED)
**Lineage:** — (Staleborn are a cultural category, not a lineage in the standard sense; most are Jawbreaker Kin or Drakegums who have begun crystallizing)
**Composition:** Crystal-Set (advanced crystallization — partially translucent, visibly fragile in some regions)
**Flavor Affinity:** Clear Neutral
**Class:** Flavorweaver (Storykeeper specialty — Candysinger adjacent, but distinct; see class notes)
**Background:** Temple Pourer
**Faction:** The Memory Keepers (Elder Keeper)

**Physical Description:** Extremely old-looking. The Crystal-Set composition has advanced to the point where light passes through some regions. Moves carefully. Every motion is deliberate. Does not rush.

**Personality:** Genuinely old. Has context that no one else in the party has. Speaks in long sentences because every word is precisely chosen. Occasionally says things that take three scenes to understand.

**Story Arc (PROPOSED):** The archivist knows the Shattering was not the first time this happened. The arc involves recovering evidence from their own archive — which was destroyed — and confirming or disproving their memory. The arc explores: what happens when memory is the last evidence, and memory is mortal?

**Gameplay Function:**
- Lore and Monster Knowledge unlocks
- Flavor-based status effects and control
- Historical item identification (provenance revelation)
- Party role: Controller / Support / Lore

---

### 4.5 The Arena Survivor

**Placeholder Name:** Ketch (PROPOSED)
**Lineage:** Gumdrop Folk
**Composition:** Aerated
**Flavor Affinity:** Cola Fizz
**Class:** Gummy Brawler (Taffy Wrestler specialty)
**Background:** Arena Survivor
**Faction:** Unaligned (suspicious of all factions equally)

**Physical Description:** A Gumdrop Folk with Aerated composition — bubbles visible beneath the surface, slightly lighter than they appear. Arena-scarred. Moves with constant low-level awareness of their environment.

**Personality:** Hypervigilant but not paranoid. Has excellent instincts about danger. Has spent so long trusting no one that trusting the player takes real time. Once trust is given, it is fierce.

**Story Arc (PROPOSED):** Won their freedom in the arena the night of the Shattering — the event caused chaos that they exploited to escape. The arc explores: what do you owe the people who could have freed you earlier but didn't? What do you do with freedom when survival was the only plan you had?

**Gameplay Function:**
- Physical combat specialist
- Grapple and crowd control
- Arena-specific expertise (NPC contacts, event knowledge)
- Party role: Bruiser / Off-tank

---

### 4.6 The Drakegum Outcast

**Placeholder Name:** Vashra (PROPOSED)
**Lineage:** Drakegums
**Composition:** Layered
**Flavor Affinity:** Grape Shade
**Class:** Syrupwarden (Oath of Retribution specialty)
**Background:** Noble Batch
**Faction:** Ashglass Wyrm Throne (exiled)

**Physical Description:** A Drakegum — physically imposing, scale-patterned surface, Layered composition meaning distinct outer shell over softer interior. The exile is visible: former noble markings partially removed, deliberately.

**Personality:** Formal in cadence, bitter in content, genuinely principled in moments that cost something. Hates what their lineage has become under the post-Shattering power grab. Hates the alternatives even more. Looking for something to believe in besides their own anger.

**Story Arc (PROPOSED):** Exiled for opposing the Ashglass Wyrm Throne's decision to use the Shattering as an opportunity for territorial expansion. The arc explores: what does loyalty to a people mean when the institution of that people is doing something wrong? Can you love a thing and oppose it at the same time?

**Gameplay Function:**
- Heavy armor and melee combat
- Ward and protection abilities (Syrupwarden class)
- Drakegum cultural intelligence
- Party role: Tank / Protector

---

## 5. Dynamic Event Types

**Status: PROPOSED**

| Event Type | Description | Frequency | Persistence |
|------------|-------------|-----------|-------------|
| Fragment Drift | A floating fragment shifts position, changing travel routes | PROPOSED: rare, scheduled | Temporary |
| Faction Clash | Two factions contest a resource or location | PROPOSED: medium frequency | Temporary |
| Monster Incursion | A monster group pushes into inhabited territory | PROPOSED: common | Temporary until cleared |
| Sugar Well Emergence | A new Sugar Well opens (Lattice residue event) | PROPOSED: rare | Persistent |
| Royal Court Edict | A Royal Court issues a law affecting surrounding regions | PROPOSED: scripted | Persistent until overturned |
| Scarcity Event | Resource shortage creates economic pressure | PROPOSED: medium | Temporary |
| Memory Keeper Discovery | A new archive site is located | PROPOSED: rare | Persistent |

---

## 6. Story Persistence Model

GUMFALL tracks the following categories of world state:

### 6.1 Permanent Changes

Events that cannot be reversed after they occur:
- Faction quest completion or failure
- Companion quest outcomes
- Royal Court political outcomes
- Main Quest chapter completions
- Certain regional arc endings

### 6.2 Faction Standing

Numeric value per faction, adjusted by quest choices, NPC interactions, and combat (attacking faction members). Standing affects:
- Available quests
- NPC dialogue
- Shop prices
- Companion reactions
- Endgame political outcomes

### 6.3 World Knowledge

Information the player has learned, tracked as flags. Affects:
- Dialogue options
- Quest shortcuts
- NPC recognition
- Monster Knowledge entries

### 6.4 Companion Relationships

Numeric value per companion. Affects:
- Companion quests (threshold to unlock)
- Battle banter
- Survival in endgame scenarios (PROPOSED)
- Story outcomes

---

## 7. Royal Court Political Outcomes

**IMPORTANT:** Specific dungeon solutions, maze layouts, and sovereign-specific quest answers are not documented here. See governance/PUBLIC_PRIVATE_BOUNDARIES.md.

Each Royal Court can end the game in one of three political states (PROPOSED):

1. **Sovereign's Alliance** — The Court joins the player's endgame coalition. Full political and military support. Requires completing the Court's internal quest line.
2. **Hostile Neutrality** — The Court is intact but not allied. Will not interfere with the player's endgame, but provides no support.
3. **Collapse** — The Court's internal structure has failed. Former court members are scattered, some may be recruited individually, but the Court as a political entity is gone.

Which outcome occurs depends on player choices throughout the regional arc and dungeon quest for that Court. Completing the full dungeon quest line is required for Sovereign's Alliance.

---

## 8. Failure States and Consequence Design

### Design Philosophy

GUMFALL's failure states are consequential without being punishing. The game distinguishes between:

- **Combat failure** (death/defeat) — Always reversible. Player restores at last checkpoint or Sugar Well.
- **Quest failure** — Some quests can be failed permanently. Quest failure does not end the game but changes the world state.
- **Faction failure** — Standing can drop to hostile. Hostile factions become combat-available. Some factions can be reapproached through specific recovery quests.
- **Companion loss** — Companions can be permanently lost if their quests are failed in specific ways. This is a feature, not a bug. Loss should mean something.

### Failure State Documentation Requirements

Every quest must document:
1. All conditions that cause quest failure
2. Whether the failure is immediate or time-delayed (some failures are not visible until later)
3. World state changes caused by the failure
4. Whether the quest is retry-available (and with what limitations)
5. Emotional impact guidance for the companion's reaction to failure

### Anti-Frustration Rules

- No quest should fail permanently due to accidental NPC death (all quest-critical NPCs have protected status).
- Quest-critical items cannot be dropped, sold, or destroyed.
- No fail state should be undiscoverable — the player must be able to understand why they failed.
- Permanent companion loss requires explicit player choice confirmation, not a single bad decision.

---

## 9. Design Notes and Open Questions

| Question | Status |
|----------|--------|
| How many companions total? | PROPOSED: 6–8 |
| Can companions die permanently in combat? | PROPOSED: No — combat failure incapacitates, quest failure kills |
| Are companion quests required for good ending? | PROPOSED: No, but they affect it |
| Is the one-armed soldier always the tutorial companion regardless of player lineage? | PROPOSED: Yes |
| What is the player character's relationship to the Shattering? | UNKNOWN |
| How many main quest chapters? | PROPOSED: 4–6 |
| Does faction standing persist through Legacy Reroll? | UNKNOWN — see [Legacy Reroll](../systems/LEGACY_REROLL.md) |
| Are all companions available from the start? | PROPOSED: No — each has a recruitment quest or encounter |

*Last updated: 2026-08-02*
