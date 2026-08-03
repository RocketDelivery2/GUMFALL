# GUMFALL — Arenas and Matchmaking
**Status tags:** VERIFIED = confirmed design authority | DERIVED = follows from verified rules | PROPOSED = candidate, not yet locked | ASSUMPTION = reasonable default, needs review | UNKNOWN = owner decision required

---

## Table of Contents
1. [Overview](#overview)
2. [The Eight Arenas](#the-eight-arenas)
3. [Arena Modes](#arena-modes)
4. [Monster Ascension Tournament](#monster-ascension-tournament)
5. [Ranked Ladder Structure](#ranked-ladder-structure)
6. [Season Structure](#season-structure)
7. [Matchmaking Design Principles](#matchmaking-design-principles)
8. [Spectator and Host UI Requirements](#spectator-and-host-ui-requirements)
9. [Arena Reward Structure](#arena-reward-structure)
10. [Related Documents](#related-documents)

---

## Overview

**[PROPOSED]** GUMFALL's arena system provides structured PvP and PvE challenge environments separate from the open world. Arenas are purpose-built combat venues with defined match formats, spectator access, and reward structures.

**[DERIVED]** All arena content follows the core PvP commitments: skill-first, level fairness through normalization, no pay-to-win. See [PvP Foundations](./PVP_FOUNDATIONS.md).

**[PROPOSED]** Arenas serve multiple functions:
- Competitive PvP ranked matches.
- Player-hosted events and community tournaments.
- Monster Ascension Tournament (PvE challenge).
- Weekly event hosting (see [Weekly Events](./WEEKLY_EVENTS.md)).
- Spectator viewing for all match types.

---

## The Eight Arenas

**[VERIFIED]** Eight arenas exist in GUMFALL.

### 1. Bronze Paw Orchard Ring

**[PROPOSED]** Location: Fractured Flats region — a mid-size fragment converted for structured combat, surrounded by candy-tree orchard remnants.

**Capacity:** Small. Solo Duel and Duo Clash formats. Spectator seating rings a circular combat surface.

**Atmosphere:** Rustic and accessible. Candy-trees with hard crystal-sugar fruit create a familiar entry environment for lower-tier competitive play. The combat surface is packed caramel-stone with organic orchard debris providing visual character without tactical cover mechanics.

**Lore Context:** Predates the formal ranked system. Began as informal dueling space maintained by a local community, later integrated into the competitive structure. The "Bronze Paw" references a kobold-forged bronze trophy originally given to duel winners by the community organizers.

**Mechanical Notes:** Open surface, minimal environmental interaction. A clean skill-expression environment for lower divisions.

---

### 2. Steelclaw Banner Colosseum

**[PROPOSED]** Location: Crystalline Highlands — a converted hobgoblin military training facility with tiered crystal-formation seating.

**Capacity:** Medium. Duo Clash and Triad Arena formats. Tiered seating accommodates significant spectator volume.

**Atmosphere:** Military and formal. Angular hobgoblin architecture with banner poles from historical ranked matches. Crystal formations scatter light creating visible but non-disorienting visual effects.

**Lore Context:** Named for the Steelclaw Banner company, a hobgoblin unit that used this facility for training before it was converted to civilian arena use under a post-Shattering Crown Accord treaty.

**Mechanical Notes:** Non-interactive crystal formations. Flat combat surface creates clear sightlines.

---

### 3. Mirrorblade Amphitheater

**[PROPOSED]** Location: Sugar Coast region — built into the curved rock face of a coastal fragment edge, with an open void-facing fourth wall.

**Capacity:** Medium. Triad Arena and Grand Formation formats. Amphitheater design naturally seats spectators on the rock face above the combat surface.

**Atmosphere:** Dramatic and windswept. Weather events from the Coast are visible and audible but buffered from affecting match outcomes. The "Mirrorblade" name comes from reflective candy-stone panels in the stage floor.

**Lore Context:** Purpose-built at the coastal community's initiative. Remains independently administered — not Crown Accord or faction-sponsored.

**Mechanical Notes:** Reflective floor panels are cosmetic. Weather backdrop is theatrical, not mechanical.

---

### 4. Fizzworks Circuit

**[PROPOSED]** Location: Dedicated fragment purpose-built as a multi-zone competition environment by the Gelwright Circle with Candy Artificer assistance.

**Capacity:** Medium-Large. All formats including Grand Formation. Multiple sub-zones can be opened or closed for different match formats.

**Atmosphere:** Technical and precise. Modular panels, gear mechanisms (decorative), carefully maintained candy-polymer surfaces. The Candy Artificer aesthetic throughout.

**Lore Context:** The Gelwright Circle's investment in the competitive ecosystem — structured competition as research. Research systems are passive observers, never interactive in matches.

**Mechanical Notes:** Optional interactive environmental elements available for specific event formats. Standard ranked matches use non-interactive layouts. Interactive elements always announced before use.

---

### 5. Cloud-Cushion Bowl

**[PROPOSED]** Location: High-altitude Crown Tier approach fragment — cloud-level candy-mist creates a visual fog at the arena's base.

**Capacity:** Medium. Solo Duel through Triad Arena. Spectator platforms elevated above cloud-mist level with clear views down into the combat surface.

**Atmosphere:** Elevated and ethereal. Altitude light quality and distant Crown-band fragments in backdrop create distinctive visual environment. The "Cloud-Cushion" name is intentionally ironic — the surface is firm candy-stone.

**Lore Context:** Established as a neutral competition venue by inter-faction agreement — a space where factions without shared territory hold competitive events without territorial implications.

**Mechanical Notes:** Cloud-mist at base is cosmetic. Altitude effects do not apply inside the arena boundary.

---

### 6. Black Knot Pit

**[PROPOSED]** Location: Wrapper Fold Zone adjacent fragment — the arena exists in physical space but Fold proximity creates distinctive perimeter visual effects.

**Capacity:** Small-Medium. Solo Duel, Duo Clash, and specialized event formats. Lower-than-surroundings Pit configuration with spectators above.

**Atmosphere:** Unsettling and distinctive. Fold proximity makes the arena perimeter shimmer with fold-visual effects that are cosmetic but unlike any other arena. The "Black Knot" comes from a twisted structural feature in the walls caused by a Fold-adjacent spatial anomaly.

**Lore Context:** Established despite community resistance over Fold proximity. Gelwright Circle structural assessments confirmed no active Fold intrusion inside the combat boundary.

**Mechanical Notes:** Fold proximity effects are cosmetic inside the combat boundary. Spirit-aspected abilities have subtle visual amplification (animation enhancement only, no mechanical change).

---

### 7. Starvault Grand Arena

**[PROPOSED]** Location: Crown Tier — the largest purpose-built arena in the game, constructed on one of the most prominent Crown Tier fragments.

**Capacity:** Large. All formats including Grand Formation. Largest spectator capacity of any non-Shattercrown venue.

**Atmosphere:** Monumental. Crown Tier crystal-sugar and sovereign-grade construction materials. The most elaborate architecture of any arena. Night events feature the arena as a lit spectacle visible across a wide area.

**Lore Context:** The Crown Accord's primary competitive investment — a statement of permanence and authority in the highest accessible tier. Partially Crown Accord funded, partially funded by competitive community event revenue.

**Mechanical Notes:** Large surface area for Grand Formation. Multiple camera positions for spectators. Host UI most fully realized here. Default location for Monster Ascension Tournament championship events.

---

### 8. Shattercrown Broken Arena

**[PROPOSED]** Location: Within Shattercrown, in the Severed Plaza district.

**Capacity:** Medium. All formats. Operates under modified rules given Shattercrown context.

**Atmosphere:** Worn, contested, marked by history. Improvised grandeur — quality construction adapted with materials sourced from Shattercrown's economic activity.

**Lore Context:** Built by Shattercrown's persistent community as a formalized venue within the full-PvP city. The irony that a lawless city has a structured arena where normalized combat is possible is acknowledged by all parties.

**Special Rules:** Can host both standard normalized matches and Shattercrown-rules matches (full progression, Risk Pouch active). Participants declare mode on entry. The only arena venue where Risk Pouch mechanics can be optionally active.

---

## Arena Modes

**[VERIFIED]** Six arena modes exist.

### 1. Solo Duel

**[PROPOSED]** 1v1 combat. The purest expression of individual skill and class mastery.

**Rules:** Standard normalization. Single or multi-life format (configurable per match/event). No team support mechanics. Available in: Bronze Paw Orchard Ring, Steelclaw Banner Colosseum, Cloud-Cushion Bowl, Black Knot Pit.

**Competitive Structure:** Primary mode for the Ranked Duel sub-ladder and personal title events.

---

### 2. Duo Clash

**[PROPOSED]** 2v2 combat. Team coordination at minimal scale — every decision amplified by one ally and two opponents.

**Rules:** Standard normalization. Pre-formed duos queue together for ranked. Both team members must be eliminated for the team to lose. Available in: Bronze Paw Orchard Ring, Steelclaw Banner Colosseum, Mirrorblade Amphitheater.

**Competitive Structure:** Duo Clash has its own ranked ladder. Duo chemistry and coordination are distinct skills from individual performance.

---

### 3. Triad Arena

**[PROPOSED]** 3v3 combat. Minimum team size at which class composition meaningfully differentiates team capability.

**Rules:** Standard normalization. Pre-formed trios or matchmade. Class diversity incentive: teams with three distinct class categories have access to broader coordination tool sets (not a stat bonus). Available in: Mirrorblade Amphitheater, Cloud-Cushion Bowl, Starvault Grand Arena.

**Competitive Structure:** Primary team competitive mode with its own ranked structure. Primary Arena Crown Cup format.

---

### 4. Grand Formation

**[PROPOSED]** Large-scale team combat. Exact team size UNKNOWN — owner decision required; candidate range 8–16 per team.

**Rules:** Standard normalization. Class composition requirements may be enforced. Objective-adjacent mechanics may apply by match type. Available in: Mirrorblade Amphitheater, Fizzworks Circuit, Starvault Grand Arena.

**Competitive Structure:** Guild Wars may use Grand Formation format. Guild Siege Week uses Grand Formation at Starvault and Fizzworks.

---

### 5. Draft Arena

**[PROPOSED]** Players draft class assignments from a pool rather than playing their primary class.

**Rules:** At match start, a class pool is presented. Players draft in sequence. Players use the drafted class with their own ability selections within that class. Normalization at bracket standard. All draft picks final before match begins. Available in: Fizzworks Circuit (primary), Starvault Grand Arena.

**Competitive Structure:** Tests class knowledge breadth rather than depth. Class Masters Tournament uses Draft Arena format.

**Accessibility Note:** Draft Arena does not require players to have previously played the drafted class — the class is provided with its standard ability set. Familiarity is advantageous, not required.

---

### 6. Monster Arena

**[PROPOSED]** Players fight waves of monsters cooperatively. No PvP between players.

**Rules:** Teams of configurable size (1–8 depending on difficulty tier) face sequential monster waves sourced from the world's actual monster families. Wave difficulty escalates. Completion tracked for score. Available in: All arenas with Monster Arena configuration.

**Competitive Structure:** Completion leaderboard. Top teams per class configuration are recognized. Primary context for Monster Ascension Tournament.

---

## Monster Ascension Tournament

**[VERIFIED]** The Monster Ascension Tournament is a formal PvE competitive mode where players face sequentially harder monsters, each encounter one level harder than the previous.

### Format
**[PROPOSED]**
- Participants queue individually or in groups by tournament tier.
- Each participant or group faces the same sequence of monsters in the same order.
- Monsters escalate: each successive monster is one level harder than the previous.
- Tournament runs until all participants are eliminated or a maximum threshold is reached.

### Escalation Rules
**[VERIFIED]**
- **Every 5th encounter:** An escalation occurs. The monster has additional modifiers — enhanced abilities, additional monsters, or environmental complications.
- **Every 10th encounter:** A champion, royal, or boss encounter — significantly more challenging, featuring named enemies from the world's Royal Court or elite monster pool.

### Deterministic Seed System
**[VERIFIED]** Tournament seeds are deterministic and announced in advance. Players and spectators know the sequence of monster types before the tournament begins.

**[PROPOSED]** Seed announcement includes:
- Monster family sequence.
- Escalation modifier types.
- Approximate difficulty curve.

**Rationale:** Deterministic seeds allow counter-strategy preparation, enable deeper spectator engagement, ensure competitive fairness (no participant faces a different sequence), and make counter-strategy a first-class design requirement.

### Counter-Strategy Requirement
**[PROPOSED]** Every monster in the tournament sequence has discoverable counter-strategies — build choices, class-specific approaches, ability selection considerations — that meaningfully improve performance. These strategies are discoverable through world engagement (lore, Gelwright Circle publications, Memory Keeper records on monster behavior) and are not exclusive to high-level players.

### Crown Score Formula
**[VERIFIED]** Crown Score = Monster Level × Rank Multiplier × Modifier Multiplier

**[PROPOSED — components]:**
- **Monster Level:** Level of the highest monster defeated before elimination.
- **Rank Multiplier:** Based on participant performance tier — Solo has higher Rank Multiplier than Duo; group sizes have lower multipliers reflecting support benefit.
- **Modifier Multiplier:** Product of all active escalation modifiers at the time of the final encounter. Higher escalation tiers carry higher Modifier Multipliers.

### Ranking Criteria
**[VERIFIED]** Five criteria determine standings, in priority order:
1. **Highest level defeated** — Primary criterion. Higher always outranks lower.
2. **Crown Score** — Tiebreaker on highest level.
3. **Total monsters defeated** — Tiebreaker on Crown Score.
4. **Remaining vitality** — Tiebreaker on total defeated (percentage at final encounter).
5. **Completion time** — Tiebreaker on remaining vitality (faster is better).

**[PROPOSED]** All five criteria tracked and displayed in spectator and results UI. Exact ties across all five share the rank.

### Championship Events
**[PROPOSED]**
- Championship events run on seasonal or major event schedule.
- Held at Starvault Grand Arena with full spectator access.
- Championship sequences use the most challenging announced seeds.
- Championship placement yields seasonal recognition and cosmetic rewards.

---

## Ranked Ladder Structure

**[VERIFIED]** Ten ranked divisions from Copper to Unbound.

| Division | Level Range | Notes |
|---|---|---|
| Copper | 10–19 | Entry-level competitive. |
| Bronze | 20–29 | First meaningful class specialization expressed. |
| Iron | 30–39 | Mid-game build diversity begins. |
| Steel | 40–49 | Regional-dungeon content depth becomes relevant. |
| Heroic | 50–59 | Full class specialization and ability depth. |
| Mithril | 60–69 | Counter-play knowledge becomes dominant. |
| Legendary | 70–80 | Mastery tier. Meta awareness and adaptation defining. |
| Mythic | 81–90 | Elite tier. Small skill differences determine outcomes. |
| Apex | 91–100 | Top tier. Boundary of current normalization range. |
| Unbound | Future | Post-expansion tier. Structure to be determined. |

**[DERIVED]** Division ranges correspond loosely to character level ranges at which the normalized bracket represents meaningful character development. High-skill players can achieve ratings in higher divisions through skill alone.

**[PROPOSED]** Each ranked mode (Solo Duel, Duo Clash, Triad Arena, Draft Arena) has independent division placement per division. A player can be Heroic in Solo Duel and Iron in Triad simultaneously.

---

## Season Structure

**[PROPOSED]** Ranked seasons have defined start and end dates known to players at season start.

### Duration
**[PROPOSED]** Not finalized. Candidate: 13 weeks (one quarter). Owner decision required.

### At Season Start
- Partial rating carry-over from previous season (approximately 50–70% of final division rating — exact value requires balance testing).
- Placement matches determine initial division assignment from the carry-over starting point.

### At Season End
- Season-end snapshot: all rankings, records, and Crown Scores preserved permanently in player account history.
- Season rewards distributed to all qualifying participants.

### Season Rewards
**[PROPOSED]**
- Cosmetic rewards only: titles, visual effect modifications, mount appearance adjustments.
- Rewards scale with highest division achieved during the season.
- **[VERIFIED]** Season rewards are not purchasable — earn-only. Season cosmetics are not re-offered in later seasons.

### Participation Requirements
**[PROPOSED]** Minimum ranked matches must be completed to qualify for season rewards. **[ASSUMPTION]** 30 matches as a working assumption — requires validation.

### Reset Philosophy
**[PROPOSED]** No full rating resets. Partial carry-over means players start from a position reflecting previous performance. Early season is competitive recalibration; late season is where stable rankings emerge. Non-participants from the previous season start from a default placement.

---

## Matchmaking Design Principles

**[PROPOSED]**

**Division-appropriate matching:** Players matched against same division or immediately adjacent. Cross-division matching only when queue times are unacceptably long, with player notification.

**Rating-based within division:** High-rated players matched against other high-rated players in the division before adjacent division cross-matching.

**Class composition awareness:** In team modes, matchmaking considers class composition to avoid severe class disadvantage mismatches. Implementation to be determined.

**Queue transparency:** Estimated wait time and matchmaking status visible. Criteria widening communicated to players.

**No hidden matchmaking factors:** **[VERIFIED]** No hidden MMR, hidden performance metrics, or hidden social network biasing. The displayed rating is the authoritative matchmaking variable.

**Solo queue viability:** **[PROPOSED]** Solo queue into team modes is supported. Solo players matched against other solo players or equal-size groups where possible. When matched against pre-formed groups, this is noted.

---

## Spectator and Host UI Requirements

**[PROPOSED]**

### Spectator UI
- Live match view with camera selection: multiple fixed angles, player-follow option.
- Body-region status indicators for all participants (no exact structural values exposed to third-party spectators beyond normal match display).
- Mode-specific score and status displays (vitality, round count, Monster Ascension level, Crown Score).
- Configurable delay option: prevents real-time shot-calling advantage in competitive events.
- Commentary layer: space for player-designated commentary visible to spectators who opt in.

### Host UI
**[PROPOSED]** Event hosts have access to:
- Match type configuration (mode, round count, time limits, normalization settings).
- Participant management (invite lists, acceptance tracking, tournament bracket seeding).
- Spectator configuration (delay settings, commentator designations).
- Schedule publication: upcoming hosted events visible to players who opt in to event notifications.

### Replay System
**[PROPOSED]** Match replays stored for a defined period post-match. Players can review own replays for improvement. Top Monster Ascension Tournament performances and high-division PvP matches may have spectator replay access.

### Accessibility in Spectator Mode
**[PROPOSED]** Spectator UI follows the same accessibility standards as the main game HUD. Color-independent status communication, scalable UI, and motion reduction apply to spectator views. See [UI/UX and Accessibility](../ux/UI_UX_AND_ACCESSIBILITY.md).

---

## Arena Reward Structure

**[PROPOSED]**

### Win Rewards
- Currency (Shattercrown currency in Broken Arena, standard currency in other arenas).
- Rating points (ranked modes).
- Material rewards for ranked matches above a minimum division threshold.

### Participation Rewards
- Reduced reward set for losses representing time and effort invested.
- Participation rewards do not replicate victory rewards exactly.

### Performance Recognition
- Monster Ascension Tournament: Crown Score displayed on seasonal leaderboards.
- Ranked modes: Division display, seasonal cosmetics at season end.
- In-arena recognition: exceptional performance displayed in the arena's historical record.

### No Pay-to-Win
**[DERIVED]** Arena rewards do not include combat-power advantages purchasable through real money. All combat-relevant rewards are earn-only. See [Live Operations and Monetization](../liveops/LIVE_OPERATIONS_AND_MONETIZATION.md).

---

## Related Documents

- [PvP Foundations](./PVP_FOUNDATIONS.md)
- [Shattercrown](./SHATTERCROWN.md)
- [Weekly Events](./WEEKLY_EVENTS.md)
- [World Regions](../world/WORLD_REGIONS.md)
- [UI/UX and Accessibility](../ux/UI_UX_AND_ACCESSIBILITY.md)
- [Live Operations and Monetization](../liveops/LIVE_OPERATIONS_AND_MONETIZATION.md)
