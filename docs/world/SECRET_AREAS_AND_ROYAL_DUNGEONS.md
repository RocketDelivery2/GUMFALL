# GUMFALL — Secret Areas and Royal Dungeons
**Status tags:** VERIFIED = confirmed design authority | DERIVED = follows from verified rules | PROPOSED = candidate, not yet locked | ASSUMPTION = reasonable default, needs review | UNKNOWN = owner decision required

**PROTECTED INFORMATION NOTICE:** This document does not contain exact maze solutions, hidden post-Level-100 thresholds, specific key sequences for any Royal Dungeon, final chamber solutions, or protected drop rate data. These are withheld by design.

---

## Table of Contents
1. [Overview](#overview)
2. [Secret Tier System](#secret-tier-system)
3. [Clue Fairness Doctrine](#clue-fairness-doctrine)
4. [Key Types](#key-types)
5. [Crown Depth System](#crown-depth-system)
6. [Royal Dungeon Structure](#royal-dungeon-structure)
7. [Post-Maze Shortcuts](#post-maze-shortcuts)
8. [Reward Philosophy](#reward-philosophy)
9. [Design Rules for Secret Area Creation](#design-rules-for-secret-area-creation)
10. [Anti-Frustration Provisions](#anti-frustration-provisions)
11. [Unbound Secrets](#unbound-secrets)
12. [Related Documents](#related-documents)

---

## Overview

**[VERIFIED]** GUMFALL's secret area system is organized into five tiers: Hidden Rooms, Deep Secrets, Royal Mazes, Mythic Sanctums, and Unbound Secrets. These tiers define both the complexity of the secret and the quality and nature of the reward.

**[VERIFIED]** The Crown Depth system — Surface, Deep, Crown, and Forbidden — defines a vertical stratification of the world and governs what secrets are accessible at what stage of a player's progression.

**[VERIFIED]** Royal Dungeons follow a six-stage structure: visible area → hidden entrance → royal maze → royal court → throne/treasury → optional deeper continuation.

**[VERIFIED]** All secrets follow the clue fairness doctrine: no secret requires blind wall-hitting or luck to discover. Every secret has at least three independent discovery paths.

**[DERIVED]** The secret area system is a core pillar of GUMFALL progression and world engagement. It is not an optional extra — it is integrated into the reward structure, lore delivery, and class/build depth. Designing secrets that are fair, discoverable, and satisfying is a primary design responsibility.

---

## Secret Tier System

### Tier 1: Hidden Rooms

**[VERIFIED]** Hidden Rooms are the entry-level secret tier. They are present throughout all regions beginning at the earliest accessible content.

**Design Intent:** Teach players that the world rewards curiosity. Hidden Rooms establish the behavioral expectation — looking for the unusual is productive — without demanding the knowledge or preparation required for higher tiers.

**Characteristics:**
- Single-location discovery. Finding the entrance reveals the room directly; no secondary puzzle.
- Clues are local and immediate — they exist within the same visual or spatial context as the entrance.
- Rewards are self-contained and matched to the region level range.
- No key required. Access is triggered by interaction, environmental condition, or behavioral discovery.
- No minimum level. Any character in the region can access any Hidden Room in that region.
- **[PROPOSED]** Completion tracked per-character with a visible indicator.

**Examples of Discovery Triggers [PROPOSED]:**
- Examining an object that visually differs from surroundings in a subtle but intentional way.
- Passing through an area at a specific time of day (if day/night cycles exist — UNKNOWN).
- Performing a specific action (rolling, crouching, pressing against a wall) near an environmental clue.
- Following a sound cue that originates from inside the hidden space.

**Reward Types:**
- Crafting material (region-appropriate)
- Small currency amount
- Lore fragment
- Common-grade blueprint

---

### Tier 2: Deep Secrets

**[VERIFIED]** Deep Secrets require more than environmental awareness to find. They involve multi-step discovery — a player must act on a clue to reveal a second clue, or must carry knowledge from a different location.

**Design Intent:** Reward players who engage deeply with the world and its lore rather than simply exploring exhaustively. Deep Secrets distinguish the engaged player from the thorough one.

**Characteristics:**
- Multi-step discovery chain. The entrance is not visible until a prerequisite has been completed.
- Clues are distributed across a wider area than Hidden Rooms — still within a region, but not co-located.
- May require a specific Key Type (see Key Types section) to open or access.
- Rewards are meaningfully better than Hidden Rooms.
- **[PROPOSED]** Some Deep Secrets have level recommendations — not requirements — based on the challenge of their content.
- **[PROPOSED]** A Deep Secret may involve a minor combat encounter, environmental challenge, or timed element.

**Examples of Discovery Triggers [PROPOSED]:**
- A lore item found elsewhere in the region describes a ritual or behavior that must be replicated at the Deep Secret's location.
- An NPC in a settlement gives an indirect reference that points to the general area.
- A visible landmark in the region can be observed from a specific angle to reveal a directional clue.
- A Behavioral Key — performing a specific action at a specific time — opens the entrance.

**Reward Types:**
- Uncommon-grade crafting material
- Moderate currency
- Lore record (more complete than Hidden Room fragments)
- Uncommon blueprint
- Region-appropriate equipment item

---

### Tier 3: Royal Mazes

**[VERIFIED]** Royal Mazes are the heart of the secret area system. Each of the seven Royal Courts [VERIFIED] is accessed through a Royal Maze — a substantial, designed navigational challenge that is not a simple corridor with a door at the end.

**Design Intent:** Create a meaningful skill and knowledge test between the player and the Royal Court. The maze is not arbitrary difficulty — it is an expression of the monster family's character, culture, and threat model. A Kobold maze is built by trap-setters. A Hobgoblin maze is built by military architects. The maze itself is characterful.

**Characteristics:**
- Royal Mazes are the largest and most complex of the five tiers in terms of physical space.
- Every Royal Maze contains the Royal Court at its conclusion. The maze is not the destination — it is the approach.
- **[PROTECTED]** Exact maze layouts, solutions, and key sequences are not disclosed in this document.
- **[PROPOSED]** Mazes contain environmental checkpoints — anchor points within the maze that unlock if reached, allowing players who return to re-enter from within rather than from the beginning.
- **[PROPOSED]** Mazes contain sub-secrets — Hidden Rooms and Deep Secrets embedded within the maze itself.
- Time pressure is present in some mazes but is never the sole or primary challenge.
- Failure in a maze (death, trap failure, etc.) returns the player to the most recent checkpoint rather than the maze entrance.
- **[PROPOSED]** Group play is supported in mazes. Design must account for solo play as a viable mode.

**Discovery:** Royal Maze entrances follow the clue fairness doctrine. The existence of each maze is public knowledge in-world (inhabitants know a royal court exists somewhere). The location of the hidden entrance is discoverable through legitimate means. See Clue Fairness Doctrine.

**Reward Types:**
- All Royal Court rewards (see Royal Dungeon Structure)
- Post-maze shortcut unlocked (see Post-Maze Shortcuts)
- Maze-specific unique loot in embedded sub-secrets

---

### Tier 4: Mythic Sanctums

**[VERIFIED]** Mythic Sanctums are post-Royal-Maze content — areas that extend beyond the Royal Court into deeper, more dangerous, and more narratively significant spaces. Not all Royal Dungeons have a Mythic Sanctum. Where they exist, they are accessed through the Royal Court's optional deeper continuation stage.

**Design Intent:** Provide endgame-tier depth for players who have completed the Royal Court challenge and want more. Mythic Sanctums escalate both mechanical difficulty and narrative stakes. They are designed for experienced players who have internalized the region's systems.

**Characteristics:**
- Access requires completion of the associated Royal Court.
- **[PROPOSED]** Some Mythic Sanctums require additional keys or conditions beyond simply surviving the Royal Court — conditions that are themselves discoverable.
- Rewards include endgame-tier materials, rare blueprints, and significant lore records.
- **[PROPOSED]** Mythic Sanctums contain Mythic-tier enemies — significantly stronger than Royal Court enemies.
- **[PROPOSED]** Group play is strongly encouraged for Mythic Sanctums but solo completion should be mechanically possible for highly skilled players.
- Mythic Sanctums contribute to Crown Depth progression.

**Reward Types:**
- Rare and unique crafting materials
- High-tier blueprints
- Significant lore records (near-complete narratives)
- Rare equipment of regional/court theme
- Crown Depth progression markers

---

### Tier 5: Unbound Secrets

**[VERIFIED]** Unbound Secrets exist. Their nature is partially concealed by design.

**Public knowledge (this is all this document discloses):**
- Unbound Secrets exist as the fifth and highest secret tier.
- Clues to Unbound Secrets may be found in the world through normal exploration and engagement with the lore.
- Unbound Secrets represent the deepest layer of designed discovery in GUMFALL.
- The rewards available through Unbound Secrets are consistent with the reward philosophy — no pay-to-win, no permanent exclusive power.
- **[PROTECTED]** Specific locations, access conditions, key types, reward contents, and any post-Level-100 thresholds associated with Unbound Secrets are not disclosed in this document.

**Design Intent (public):** To create discovery experiences that feel genuinely rare — not gated by artificial obscurity, but requiring synthesis of knowledge, world understanding, and in some cases community cooperation. Unbound Secrets respect the clue fairness doctrine even though their clues are the most distributed and subtle of any tier.

---

## Clue Fairness Doctrine

**[VERIFIED]** Every secret in GUMFALL — at every tier — must have at least three independent paths by which a player can discover it. No secret should require:
- Blind wall-hitting (pressing against every surface hoping for a reaction).
- Random luck (no RNG-gated discovery).
- Out-of-world resources (no requirement to consult external wikis, broadcasts, or purchased guides).
- Observation of another player performing the discovery (though community cooperation is permitted at higher tiers as one of the three paths, not the only path).

**The Three-Path Rule [VERIFIED]:**
A secret is considered fairly designed when it has:
1. **An environmental path** — Something in the immediate or nearby environment provides a clue that can be read by a careful observer without prior knowledge.
2. **A narrative path** — Lore, dialogue, books, memory fragments, or NPC conversation provides a reference that a player who engages with the world's story will encounter.
3. **A knowledge path** — Mechanical understanding of how the world works (e.g., understanding that a certain material reacts a certain way, or that a certain monster family has a documented behavior) points toward the discovery method.

**[PROPOSED]** These three paths do not need to point to the same clue — they point to the same secret. A player who follows any one of the three paths independently should have enough information to attempt the discovery.

**Application by Tier:**
- **Hidden Rooms:** All three paths are local. The environmental path is primary.
- **Deep Secrets:** Paths may be distributed across a region. Any one path should be sufficient.
- **Royal Mazes:** Paths may be distributed across a region and into adjacent regions. The existence of the maze is public knowledge in-world; the paths lead to the hidden entrance's location and conditions.
- **Mythic Sanctums:** Paths may cross multiple regions. May require prior completion of Royal Court.
- **Unbound Secrets:** Paths are the most distributed. Community synthesis of individual clues is a valid design expectation, but each individual clue must itself be discoverable by the three-path rule at the local level.

**Anti-frustration verification [PROPOSED]:** Each secret must be design-reviewed with the question: "Can a player who has never looked up this secret, but who has played the game attentively and engaged with the world's systems, find this in a reasonable play session?" If the answer is no, the secret needs additional or clearer clues.

---

## Key Types

**[VERIFIED]** Multiple key types exist for accessing secrets at Tier 2 and above. Keys are not always literal objects — they are the mechanism by which access is earned.

### Physical Key
**Description:** An actual item carried in inventory. May be a crafted key, a dropped key from a specific enemy, or a found key in a different location.
**Characteristics:** Tradeable or non-tradeable depending on design intent. Some physical keys are single-use; others persist.
**Example:** A specific kobold warden drops a key that opens a sealed passage in a nearby Deep Secret.
**Fairness:** The drop source must be discoverable through the three-path rule.

### Fragmented Key
**Description:** A key that exists in pieces distributed across a region or multiple regions. All pieces must be assembled before the key is complete and functional.
**Characteristics:** Fragments may be found through multiple means — combat drops, environment discovery, lore sequence. Assembly may require crafting.
**Example:** Three fragments of an old royal seal, each hidden in a different sub-area of a region, combine into a key for a Mythic Sanctum entrance.
**Fairness:** Each fragment must be individually discoverable by the three-path rule.

### Knowledge Key
**Description:** The key is not an item — it is knowing something. Presenting information, answering a question, or reciting a sequence based on in-world lore grants access.
**Characteristics:** Cannot be shared or traded. Must be earned through engagement with the world's narrative. Can never be required to be read from out-of-world sources.
**Example:** A sealed library requires a visitor to name the founding monarch of a specific royal line — information available in multiple lore fragments found throughout the region.
**Fairness:** The knowledge must be discoverable in-world through the three-path rule before the test that requires it is presented.

### Behavioral Key
**Description:** Performing a specific action, sequence of actions, or behavior opens access. No item required.
**Characteristics:** May be time-dependent (but not in a way that requires precise real-world scheduling). May require specific character state.
**Example:** Bowing before a statue of a gnoll ancestor causes the base to shift and reveal a passage. The bowing behavior is referenced in a lore fragment found nearby.
**Fairness:** The behavior must be referenced by at least one of the three discovery paths before a player would reasonably need to perform it.

### Crafted Key
**Description:** A key that must be manufactured using the crafting system. The recipe must be discovered first; the materials must be gathered.
**Characteristics:** Recipe is itself a secret discovery item. Materials may require regional sourcing.
**Example:** A Confectioner who discovers a recipe for a specific confection can use that item to pass a barrier that responds to its aroma.
**Fairness:** The recipe discovery and material sources must both be governed by the three-path rule.

### World-State Key
**Description:** A condition of the game world — faction standing, a completed quest, a regional dynamic event status — unlocks access.
**Characteristics:** The world state must be achievable through normal play. Cannot require purchasing faction standing.
**Example:** A secret area's entrance only opens during a specific regional dynamic event. The event itself is public; the connection to the secret is the discovery.
**Fairness:** The connection between world state and secret must be discoverable by the three-path rule.

---

## Crown Depth System

**[VERIFIED]** The Crown Depth system is a vertical stratification of the Shattered Sweetlands world into four layers: Surface, Deep, Crown, and Forbidden. These layers govern what secrets are accessible at what stage of progression, and they create a narrative framework for the escalation of difficulty and mystery as players advance.

### Surface
**[VERIFIED]** The Surface layer corresponds to the normal, accessible portions of all regions. All Hidden Rooms and most Deep Secrets exist at the Surface layer. Players access Surface content through normal regional exploration.

**Mechanics:**
- No special access requirement beyond being in the region.
- Standard environmental hazards apply.
- Normal creature encounters.
- **[PROPOSED]** Surface-layer secrets are not explicitly labeled as such — players learn the concept through play rather than through UI.

**Narrative:** The Surface layer is the world as it presents itself. The visible, the inhabited, the trafficked.

### Deep
**[VERIFIED]** The Deep layer corresponds to the sub-surface or hidden infrastructure of regions — caves beneath fragments, sealed vaults, flooded lower levels, sub-dungeon extensions. Deep Secrets at the higher end of Tier 2, all Royal Maze content, and entry-level Mythic Sanctum content exists at the Deep layer.

**Mechanics:**
- Access to the Deep layer requires discovering entrances — it is not separately gated by character level or a "tier unlock."
- The act of finding the Deep layer entrance is itself the primary challenge.
- Encounters and hazards are escalated relative to Surface equivalents in the same region.
- **[PROPOSED]** The Deep layer of a region may contain resources that do not exist on the Surface layer of that region.

**Narrative:** The Deep layer is what the world hides — the roots of power, the buried history, the places that require intent to reach.

### Crown
**[VERIFIED]** The Crown layer corresponds to the innermost and highest-consequence secret spaces — the Royal Courts themselves, full Mythic Sanctum content, and some Crown Tier region content. Crown-layer content is the reward for mastering the Deep layer.

**Mechanics:**
- Access to Crown layer content requires successfully navigating the associated Royal Maze or Mythic Sanctum approach.
- Crown layer content is explicitly designed as the endgame challenge of its region and royal family.
- Rewards from Crown layer content are guaranteed to include significant material (crafting material, currency, lore, blueprint, region-appropriate item — per [VERIFIED] reward categories).
- **[PROPOSED]** Some Crown layer areas are persistent spaces — players who enter leave evidence of their presence (footprints in dust, displaced objects) that other players may observe, creating a passive social layer.

**Narrative:** The Crown layer is where power lives. Royal Courts. Thrones. Treasuries. The places that powerful entities chose specifically because they are hard to reach.

### Forbidden
**[VERIFIED]** The Forbidden layer exists. Its specific nature is not disclosed in this document.

**Public knowledge:**
- The Forbidden layer is the deepest and most restricted layer of the Crown Depth system.
- Players who approach the Forbidden layer encounter escalating resistance that is not conventional combat.
- The Forbidden layer is connected to the Unbound Secret tier.
- **[PROTECTED]** Exact thresholds, conditions, and contents of the Forbidden layer are not disclosed publicly.

**Narrative (public):** The Forbidden layer is what the world actively does not want accessed. This is not a design description of difficulty — it is a narrative description. Something in the Forbidden layer does not want to be found.

---

## Royal Dungeon Structure

**[VERIFIED]** All seven Royal Dungeons share the same six-stage structural progression. The content and character of each stage differs by royal family. The structure itself is the invariant.

### Stage 1: Visible Area

**Description:** The outermost portion of a Royal Dungeon's zone — the part that is publicly known and freely accessible. This is the region content that players encounter during normal exploration of the relevant region.

**Design Intent:** Orient players to the monster family's culture, behavior, and combat style before the dungeon begins. Establish that there is more here than the visible surface suggests.

**Characteristics:**
- Normal region-difficulty encounters for the monster family.
- Environmental clues to the hidden entrance exist here.
- NPCs or lore sources may reference the existence of a royal structure.
- The visible area does not feel like a dungeon — it feels like a region.

**Player Experience Goal:** Players exploring the visible area should find the world coherent and inhabited. The sense that something exists beneath or beyond should arise organically from engaging with this content.

---

### Stage 2: Hidden Entrance

**Description:** The entrance to the Royal Maze is not visible from the Visible Area without active discovery effort. Finding it requires applying at least one of the three clue-fairness discovery paths.

**Design Intent:** Gate the Royal Maze with discovery skill, not character power. The hidden entrance is the first test — can you find the door?

**Characteristics:**
- Governed by the Clue Fairness Doctrine.
- The entrance may require a specific Key Type to open once found.
- Finding the entrance does not commit a player to the maze — they can turn back.
- **[PROPOSED]** A visible indicator exists once the entrance has been found — subtle, character-appropriate, not a glowing waypoint.
- **[PROTECTED]** Specific entrance locations and key requirements for each Royal Dungeon are not disclosed in this document.

**Player Experience Goal:** The moment of finding the hidden entrance should feel earned. The discovery should make sense in retrospect — "of course it was there."

---

### Stage 3: Royal Maze

**Description:** The designed navigational challenge between the entrance and the Royal Court. Characterized by the monster family's architectural and cultural identity.

**Design Intent:** Create a meaningful challenge that expresses who built this place and why. The maze is a cultural document as well as a navigational obstacle.

**General Characteristics (all mazes):**
- Contains internal checkpoints that persist on return visits.
- Contains embedded sub-secrets (Hidden Rooms and Deep Secrets within the maze).
- Supports both solo and group play.
- Death in the maze returns players to the most recent checkpoint, not the entrance.
- Contains enemies appropriate to the monster family and the dungeon's depth rating.
- Environmental hazards specific to the monster family's culture.
- **[PROTECTED]** Specific maze layouts, solutions, trap locations, and key sequences are not disclosed.

**Maze Character by Royal Family [PROPOSED, not solutions]:**
- **Cindercoil Warrens (Kobolds):** Trap-setters built this. Heat, mechanism, and calculated snare.
- **Red Banner Labyrinth (Hobgoblins):** Military architects. Formation choke points and strategic denial.
- **Moonfang Court (Gnolls):** Pack hunters. Scent, sight, and sound are all weapons here.
- **Root-Crown Hollows (Trolls):** Growers and shapers. The maze is alive and may change.
- **Pale Sugar Crypt (Staleborn):** Preservers of grief. Memory and crystallization are the obstacles.
- **Ashglass Wyrm Throne (Dragons):** Ancient and enormous. Scale and heat redefine what "navigating" means.
- **Folded Court (Wrapperborn):** Dimensional fold architects. The maze is partially inside-out.

**Player Experience Goal:** Players who complete a Royal Maze should feel they have learned something about the culture that built it, not just that they navigated some geometry.

---

### Stage 4: Royal Court

**Description:** The inhabited court of the royal family — the living space, governance center, and populated stronghold of the monster royal pair. Both the King and Queen are present (except where lore dictates otherwise).

**Design Intent:** Create a destination that feels inhabited, not just constructed. The Royal Court should feel like a real place where real beings live, hold court, make decisions, and defend their domain.

**Characteristics:**
- The King and Queen are distinct entities with distinct roles, behaviors, and combat profiles.
- Royal Court inhabitants react to player presence — the encounter is not simply walking into a room.
- The Royal Court contains the final challenge before the throne.
- **[PROPOSED]** Diplomatic options may exist in some courts — not all encounters must be resolved through combat. Class and attribute investment may unlock non-combat approaches.
- Rewards begin to be distributed starting at the Royal Court stage.

**Player Experience Goal:** Players should feel the weight of who they're dealing with. The King and Queen of any royal family are meaningful individuals, not generic boss-pair encounters.

---

### Stage 5: Throne and Treasury

**Description:** The innermost chamber or chambers of the Royal Court — the throne room and the associated treasury.

**Design Intent:** Deliver the payoff for the entire dungeon sequence. The throne is the symbol of royal authority; the treasury is the material reward for reaching it.

**Characteristics:**
- Guaranteed reward distribution: crafting material + currency + lore record + blueprint + region-appropriate item. [VERIFIED]
- The throne room has narrative significance — not just a room with a loot chest.
- **[PROTECTED]** Specific drop rates, unique item details, and exact treasure contents are not disclosed publicly.
- **[PROPOSED]** Players who have completed the Royal Court encounter unlock a throne-room marker — a form of recognition of completion.
- The treasury's exact contents vary between visits according to the game's loot systems.

**Player Experience Goal:** The Treasury should feel worth what it took to get here. The guaranteed reward structure ensures players who complete the dungeon always receive meaningful material even if specific rare drops do not occur.

---

### Stage 6: Optional Deeper Continuation

**Description:** For Royal Dungeons that have a Mythic Sanctum, the sixth stage is the passage beyond the throne — a transition into the Mythic Sanctum content.

**Design Intent:** Not every visit needs to go this far. The optional deeper continuation is clearly optional — players who have completed the throne receive their guaranteed reward regardless of whether they continue.

**Characteristics:**
- Access to the deeper continuation may require additional conditions discovered through the clue fairness doctrine.
- The passage beyond the throne is visually distinct from what came before — it communicates "this is different."
- **[PROPOSED]** Some Royal Dungeons have no Mythic Sanctum and the optional stage is absent. This is not indicated by UI — it is discovered through exploration.
- Deeper continuation connects to the Crown Depth's Crown and potentially Forbidden layers.

**Player Experience Goal:** The deeper continuation should feel like the world extending rather than a difficulty cliff. Players should feel drawn forward by curiosity, not forced by progression pressure.

---

## Post-Maze Shortcuts

**[VERIFIED]** Upon completing a Royal Maze for the first time, players unlock a post-maze shortcut.

**What Shortcuts Are:**
- **[PROPOSED]** A shortcut is a passage, mechanism, or alternative route that allows players on repeat visits to bypass a significant portion of the Royal Maze and enter closer to the Royal Court.
- Shortcuts are not teleports — they are physical paths within the maze structure that are unlocked by knowledge of the maze or by physical activation on first completion.
- Shortcuts are per-character, not server-wide. Other players must discover and complete the maze themselves.

**What Shortcuts Are Not:**
- Shortcuts do not bypass the Royal Court, Throne, or Treasury stages.
- Shortcuts do not grant rewards — they save traversal time on repeat visits.
- Shortcuts do not exist for Hidden Rooms or Deep Secrets (those are not revisited in the same way).
- Shortcuts do not function as fast-travel to the dungeon entrance — players must still reach the region and the hidden entrance.

**Design Intent:** Respect players' time on repeat visits while preserving the integrity of the dungeon design. The maze is a challenge meant to be overcome once with full effort. Subsequent visits serve farm, completionism, or group assistance purposes where the challenge has already been passed.

**[PROPOSED]** Shortcuts may be in different forms by dungeon: a secret door only visible from the inside, a mechanism that resets a collapsed passage, a creature guide (a non-hostile entity that escorts returning players), or knowledge of a word or gesture that pacifies a gate mechanism.

---

## Reward Philosophy

**[VERIFIED]** All Royal Dungeons guarantee the following reward categories upon completion of the Throne and Treasury stage:
- Crafting material (region and monster-family appropriate)
- Currency (appropriate to dungeon tier)
- Lore record (narrative content)
- Blueprint (craftable item recipe)
- Region-appropriate equipment item

**[DERIVED]** These guaranteed categories ensure no player completes a Royal Dungeon without meaningful material gain, preventing cases where luck entirely determines whether a difficult achievement was "worth it."

**General Principles:**

**Loot is grounded [VERIFIED]:** All drops come from the actual monster family, the actual region, and the actual dungeon theme. A kobold dungeon does not drop dragon-themed material. A staleborn crypt does not drop gnoll fang necklaces. Loot is evidence of where it came from.

**No exclusive power behind secrets [DERIVED from no-pay-to-win and competitive fairness rules]:** Secret area rewards enhance and express character builds but do not create power that is unavailable through other means. A player who finds no secret areas competes meaningfully with one who finds all of them. Secrets reward engagement, not mandatory effort.

**Blueprint rewards are meaningful [PROPOSED]:** Blueprints found in Royal Dungeons and Mythic Sanctums produce items that are thematically appropriate to the dungeon and mechanically interesting — not just better versions of existing items, but items with distinct characteristics tied to the dungeon's culture.

**Lore rewards are complete [PROPOSED]:** Lore records found in Royal Dungeons are not fragments — they are complete or near-complete narratives. Fragment lore is appropriate for Hidden Rooms and Deep Secrets, but Royal Dungeon lore should feel like a real discovery.

**No time-limited exclusivity [DERIVED from monetization principles]:** Secret area rewards are not rotated out or made unavailable at season end. Players who access a Royal Dungeon later in the game's life can still receive the same guaranteed categories.

**[PROTECTED]** Exact drop tables, specific rare items, probability data, and anything governing Forbidden layer rewards are not disclosed in this document.

---

## Design Rules for Secret Area Creation

**[PROPOSED]** The following rules govern the creation of new secret areas at any tier.

1. **Every secret has a reason.** A secret area exists in the world for a story reason. What was it? Who made it? Why is it hidden? The answer to these questions should be implied by the space itself.

2. **The three-path rule is non-negotiable.** No secret at any tier ships without at least three independently functional discovery paths verified in design review.

3. **No blind luck.** If the discovery method contains any element that requires random action (pressing every surface, trying every possible behavior), the design is rejected and revised.

4. **The space is inhabited or was inhabited.** Empty rooms with loot are not secrets — they are loot closets. A secret area should feel like it was made for a purpose by someone, and that purpose should be evident from the environment.

5. **Reward matches effort and tier.** A Tier 1 Hidden Room should not contain Mythic Sanctum-tier rewards. A Tier 4 Mythic Sanctum should not reward at Hidden Room quality.

6. **Shortcuts are planned from the beginning.** Royal Maze designers plan the post-maze shortcut during initial design, not as an afterthought. The shortcut should be elegant — it should feel like a natural part of the space.

7. **Culture expresses through design.** A Wrapperborn-designed space looks nothing like a Hobgoblin-designed space. Cultural signature is required at every tier.

8. **Secrets connect to the world.** A secret area should have at least one connection to the broader world — a faction reference, a lore connection, a material tie to the region. No secret is an island.

9. **Accessibility provisions apply.** Secret areas must be playable with the full range of accessibility options enabled. A secret that can only be discovered through color-dependent clues requires a color-independent alternative.

10. **Group and solo viability.** At every tier, both solo and group play must be viable modes for discovery and completion. Group-only design is prohibited.

---

## Anti-Frustration Provisions

**[PROPOSED]** The following provisions are required for the secret area system to maintain player goodwill.

**Internal checkpoints in Royal Mazes:** Reaching a checkpoint in a Royal Maze permanently records that progress for the character. Players who quit and return, or who die in the maze, restart from their most recent checkpoint. The beginning of the maze is never revisited after a checkpoint is reached.

**Death preservation:** Dying in a secret area does not remove discovered lore, collected crafting materials, or progress toward checkpoints. Only items that normal death rules would remove are removed.

**Clue repetition:** Key clues in the narrative and environmental paths for a secret should appear in more than one location. A single unique text that only exists in one place and is the only path to a secret is not a fair design — that single point of failure is an anti-frustration failure.

**Clear completion indicators:** Players should know when they have fully completed a secret area at any tier. This does not spoil any other secret's existence — a hidden room completion is indicated; a Royal Dungeon throne stage completion is indicated. Open-ended "did I find everything?" uncertainty is acceptable for the secret's existence but not for its completion.

**No softlocking:** No combination of player actions, choices, or equipment states should be able to create a condition where a player is permanently locked out of a secret they have discovered. Keys that can be permanently destroyed before use, passages that close permanently before completion, and similar failure modes are prohibited by design.

**[PROPOSED]** Time-limited secrets — secrets that are only accessible during real-world limited windows — are prohibited at Tier 2 and above. Tier 1 Hidden Rooms may have day/night or season-equivalent access windows if a day/night cycle is implemented, but must be accessible in a reasonable in-game play session.

---

## Unbound Secrets

**[VERIFIED]** Unbound Secrets exist as the fifth tier of the secret area system.

**What is publicly known:**
- Unbound Secrets are the highest-tier secrets in GUMFALL.
- Their clues exist in the world and are discoverable through the three-path rule at the local level of each individual clue.
- The synthesis of individual clues into the complete picture of an Unbound Secret may require community engagement — not as a mandatory design element, but as an emergent possibility the design accounts for.
- Unbound Secrets connect to the Forbidden layer of the Crown Depth system.
- The rewards available through Unbound Secrets are consistent with the reward philosophy: they enhance and express character builds without creating mandatory-power gaps.
- Unbound Secrets are not connected to paid content or monetization systems.

**What is not disclosed:**
- Specific locations of any Unbound Secret.
- The number of Unbound Secrets in the game.
- Access conditions.
- Reward specifics.
- Any relationship between Unbound Secrets and the game's post-Level-100 systems.
- Anti-cheat signatures or detection mechanisms protecting Unbound Secrets.

**Design Intent (public statement):** Unbound Secrets are designed for the player who has engaged with everything else the game offers and wants a layer that rewards genuine synthesis of world knowledge, game mastery, and — possibly — cooperation with other players who have made different discoveries. They are not inaccessible to individuals; they are designed to feel genuinely rare without being artificially locked.

---

## Related Documents

- [World Regions](./WORLD_REGIONS.md)
- [Royal Courts Public Catalog](./ROYAL_COURTS_PUBLIC_CATALOG.md)
- [PvP Foundations](../multiplayer/PVP_FOUNDATIONS.md)
- [Arenas and Matchmaking](../multiplayer/ARENAS_AND_MATCHMAKING.md)
- [Weekly Events](../multiplayer/WEEKLY_EVENTS.md)
- [UI/UX and Accessibility](../ux/UI_UX_AND_ACCESSIBILITY.md)
- [Audio and Music](../audio/AUDIO_AND_MUSIC.md)
