# GUMFALL — PvP Foundations
**Status tags:** VERIFIED = confirmed design authority | DERIVED = follows from verified rules | PROPOSED = candidate, not yet locked | ASSUMPTION = reasonable default, needs review | UNKNOWN = owner decision required

---

## Table of Contents
1. [PvP Design Philosophy](#pvp-design-philosophy)
2. [Ruleset Overview](#ruleset-overview)
3. [Duels](#duels)
4. [Ranked Arena](#ranked-arena)
5. [Open Ascension](#open-ascension)
6. [Battlegrounds](#battlegrounds)
7. [Guild Wars](#guild-wars)
8. [Lawless City (Shattercrown)](#lawless-city-shattercrown)
9. [PvPvE Invasions](#pvpve-invasions)
10. [Normalization Rules](#normalization-rules)
11. [Combat Scalars (PROPOSED)](#combat-scalars-proposed)
12. [Limb Damage in PvP](#limb-damage-in-pvp)
13. [Status Effect Diminishing Returns](#status-effect-diminishing-returns)
14. [Enchantment Budget System](#enchantment-budget-system)
15. [Malady in PvP](#malady-in-pvp)
16. [Legacy Points in Ranked](#legacy-points-in-ranked)
17. [Anti-Exploit Provisions](#anti-exploit-provisions)
18. [Consent Systems](#consent-systems)
19. [Level Fairness Mechanisms](#level-fairness-mechanisms)
20. [Rating and Season Structure](#rating-and-season-structure)
21. [Related Documents](#related-documents)

---

## PvP Design Philosophy

**[VERIFIED]** GUMFALL PvP is built on the following commitments. These are not aspirational — they are design constraints that override individual system decisions when conflicts arise.

### Skill-First
**[VERIFIED]** Player skill — mechanical execution, decision-making, class knowledge, matchup understanding — is the primary determinant of PvP outcomes. Systems are designed to surface skill differences rather than obscure them.

This means:
- Character power differences from progression are managed through normalization in competitive modes.
- No single ability, build, or item should be so dominant that it eliminates the role of skill in any matchup.
- Counter-play must exist for all threats. Every status effect, every ability, every build choice must have a meaningful counter accessible within normal play.

### Level Fairness
**[VERIFIED]** No player wins or loses PvP matches primarily because their character level is higher or lower than their opponent's. Level-appropriate normalization is applied in all ranked and competitive modes.

### No Pay-to-Win
**[VERIFIED]** No element of PvP success is purchasable. Cosmetics purchased or earned through monetization systems have zero effect on PvP combat outcomes. No paid item, currency, or service provides competitive advantage in any PvP mode.

### No Mandatory Malady
**[VERIFIED]** The Malady system — the character trauma and condition system — is not a requirement in competitive PvP. Players can participate in ranked PvP without any active Malady conditions. Malady handling in specific modes is documented below.

### Shared Rules
**[VERIFIED]** Players and enemies share the same physical rules. The GelFlow combat system — body-region damage, limb states, structural mechanics — applies to player characters in PvP exactly as it applies to player characters in PvE. There are no "PvP only" mechanics that bypass the core physical simulation.

### Anatomy-Driven
**[DERIVED]** Because GelFlow is the combat foundation, PvP combat inherits the anatomy-driven encounter design. Targeting specific body regions of opponent player characters produces the same functional consequences as targeting body regions of enemies. Limb loss in PvP follows the physical logic of the game, not a simplified HP reduction.

### Expandable
**[DERIVED]** The PvP system is designed to support future rulesets, arenas, and seasonal modes without requiring architectural overhaul. New modes are additive, not replacements.

---

## Ruleset Overview

**[VERIFIED]** The following PvP rulesets exist:

| Ruleset | Key Property | Normalization | Notes |
|---|---|---|---|
| Duels | Consensual 1v1 | Configurable | Casual and competitive modes |
| Ranked Arena | Competitive matchmaking | Full normalization | Seasonal ladder |
| Open Ascension | Full progression enabled | None | Opt-in, consent required |
| Battlegrounds | Team objective-based | Full normalization | Structured teams |
| Guild Wars | Guild vs Guild | Full normalization | Scheduled conflicts |
| Lawless City | Shattercrown full-PvP zone | Partial (see Shattercrown doc) | Explicit consent + level gate |
| PvPvE Invasions | Players enter PvE spaces | Specific ruleset (below) | Opt-in for both sides |

---

## Duels

### Description
**[PROPOSED]** Duels are consensual 1v1 combat between any two players. A duel challenge can be issued anywhere outside of protection zones. The challenged player must accept before the duel begins — no automatic entry.

### Modes
**[PROPOSED]**
- **Casual Duel:** No rating at stake. Default normalization: none (fight at actual character level and equipment). Best for friendly comparison or practice.
- **Ranked Duel:** Rating implications. Full normalization applied (same rules as Ranked Arena). Counted toward Ranked Duel sub-ladder.
- **Exhibition Duel:** No rating, player-configurable normalization settings. Intended for practice, streaming, and community events.

### Rules
**[PROPOSED]**
- Duel end condition: opponent reduced to 0 vitality, surrender, or timeout.
- Death in a Ranked Duel does not apply standard death consequences (item durability, etc.) — match rules apply.
- Bystanders cannot intervene in an active duel without invitation.
- Limb loss in duels is match-scoped (see Limb Damage in PvP section).

### Consent
**[VERIFIED]** Duels require explicit acceptance by the challenged player. No automatic or coerced duel entry exists.

---

## Ranked Arena

### Description
**[PROPOSED]** Ranked Arena is the primary competitive PvP ladder. Players queue individually or in pre-formed groups for structured matches in the arena system. Rating is tracked across a seasonal period.

### Structure
**[VERIFIED]** Ranked divisions (in ascending order): Copper (10–19), Bronze (20–29), Iron (30–39), Steel (40–49), Heroic (50–59), Mithril (60–69), Legendary (70–80), Mythic (81–90), Apex (91–100), Unbound (future expansion).

**[PROPOSED]** Division brackets define matchmaking pools. Players are matched against players in the same division or adjacent divisions.

### Normalization
**[VERIFIED]** Ranked Arena applies full normalization. What normalization preserves and what it scales is documented in the Normalization Rules section.

### Placement
**[PROPOSED]** New ranked players complete placement matches before receiving an initial division assignment. Placement accounts for prior ranked history if available.

### Season Length
**[PROPOSED]** Season length is not finalized. Candidate: 13 weeks (one quarter). Owner decision required on exact duration.

### Rating
**[PROPOSED]** Rating is tracked within each division. Points are earned on wins and deducted on losses. Division promotion and demotion occurs at thresholds. The exact point system is to be determined.

### Entry Requirement
**[PROPOSED]** Minimum level required to participate in Ranked Arena. Exact minimum to be determined — must align with the earliest level at which character builds are meaningfully expressed. **[ASSUMPTION]** Minimum Level 10 as a working assumption; requires validation.

---

## Open Ascension

### Description
**[VERIFIED]** Open Ascension is full-progression PvP — combat with no normalization applied, players fighting at their actual character level, equipment, and attribute investment.

### Key Properties
**[VERIFIED]**
- No normalization of any kind.
- Full character progression is active.
- Explicit opt-in consent is required.
- **[VERIFIED]** No hidden level matchmaking — players know approximately who they're competing against in terms of tier.

### Format
**[PROPOSED]** Open Ascension may be run as:
- Open zone events where opted-in players encounter each other in designated areas.
- Scheduled Open Ascension events (see Weekly Events).
- Tournament-style brackets where participants opt in as a group.

### Fairness Note
**[DERIVED]** Open Ascension is inherently unequal by design — higher-progression characters have genuine advantage. This is the intended experience. The opt-in requirement means no player is forced into this experience. The no-hidden-level-matchmaking rule ensures players are never matched into a power disparity they couldn't anticipate.

### World Apex Integration
**[VERIFIED]** Open Ascension is the primary context for World Apex title competition. World Apex ranking incorporates: level + XP + Trial score + Apex Rating + timestamp. World Apex holders receive a +1 temporary all-attributes bonus. No XP multiplier. No advantage in normalized PvP modes.

---

## Battlegrounds

### Description
**[PROPOSED]** Battlegrounds are large-scale team PvP with objective-based gameplay. Teams compete for control of objectives, fragment points, or other structured goals.

### Structure
**[PROPOSED]**
- Pre-formed or matchmade teams.
- Full normalization applied.
- Match length bounded — win conditions and time limits prevent indefinite matches.
- Objectives vary by specific Battleground map.

### Available Battlegrounds
**[PROPOSED — incomplete list, owner decision required]**
- Fragment Control — three capturable fragments; team controls majority wins rounds.
- Extraction Race — teams compete to extract materials from a contested central zone.
- Additional maps to be determined.

### Class Composition
**[PROPOSED]** Battleground queue may enforce loose class-category diversity requirements to prevent all-healer or all-heavy stacking, in service of the readable-impacts design pillar.

---

## Guild Wars

### Description
**[PROPOSED]** Guild Wars are scheduled PvP conflicts between guilds. Two guilds in active conflict status may schedule a Guild War at agreed times. Guild War outcomes affect guild standing and potentially resource access.

### Structure
**[PROPOSED]**
- Requires both guild leadership teams to agree to conflict.
- Full normalization applied.
- Win conditions: capture objectives, eliminate opposing guild's command team, or score threshold.
- Duration: bounded. Extended Guild War events may span multiple scheduled sessions (Guild Siege Week event format).

### Guild Standing
**[PROPOSED]** Guild War outcomes contribute to guild-level standing metrics. Standing affects access to guild-specific content and recognition systems. Standing is not a direct power amplifier.

---

## Lawless City (Shattercrown)

**[VERIFIED]** Shattercrown is GUMFALL's opt-in full-PvP city. It operates as a distinct ruleset with its own economy and rules. Full documentation: [Shattercrown](./SHATTERCROWN.md).

**Key properties for PvP foundations reference:**
- Requires explicit consent + minimum level to enter.
- Players designate what they're willing to risk in the Risk Pouch.
- Never drops: bound gear, permanent progression, paid cosmetics, essential quest items.
- Tyrant of Shattercrown system confers ceremonial/governance benefits, not combat power or XP multipliers.
- Crowd Scent anti-zerg mechanic prevents infinite stacking.
- Underdog rewards compensate for unfavorable numbers.

---

## PvPvE Invasions

### Description
**[PROPOSED]** PvPvE Invasions allow one group of players (the invaders) to enter the active PvE session of another group (the defenders). Both sides must have invasion participation enabled in their settings.

### Rules
**[PROPOSED]**
- **Defender opt-in required:** Players who do not want invasion enabled are never invaded.
- **Invader opt-in required:** Players who want to invade must have invasion enabled.
- Invaders enter the defender's active PvE space with a defined entry point.
- PvE enemies are active for both sides during the invasion.
- Invasion end conditions: invaders eliminated, defenders eliminated, invasion timer expires, invaders extract.
- Level differential between invaders and defenders is visible to both parties before the invasion commits.
- **[PROPOSED]** Invasion rewards calibrated to risk and outcome.

### Accessibility
**[PROPOSED]** Invasion notification gives defenders real-time warning with time to prepare before invaders arrive. No instant ambush from spawn.

---

## Normalization Rules

**[VERIFIED]** Ranked Arena, Battlegrounds, and Guild Wars apply full normalization. Normalization standardizes character power for competitive fairness while preserving meaningful choices.

### What Normalization Preserves

**[VERIFIED]**
- **Class:** Player class is fully preserved.
- **Specialty:** Class specialty investment is preserved.
- **Weapon family:** Weapon family choice is preserved.
- **Armor category:** Armor category choice is preserved.
- **Ability choices:** Active and passive ability selections are preserved.
- **Skill:** Player mechanical skill is the variable normalization cannot remove.

### What Normalization Scales

**[PROPOSED]**
- Character level normalized to the bracket's effective level.
- Primary attribute totals scaled to bracket standard.
- Derived attribute values follow from scaled primaries.
- Equipment item level scaled to bracket standard ceiling.

### Legacy Point Effectiveness in Ranked
**[VERIFIED]** Legacy points are effective at 20% in ranked normalized contexts. A player with maximum legacy investment has a real but bounded advantage over a player with none — within the range that high skill can overcome.

### World Apex Bonus in Normalized PvP
**[VERIFIED]** World Apex bonus (+1 temporary all attributes) is disabled in normalized PvP modes. It applies only in Open Ascension and open-world contexts.

### Shared Enchantment Budget
**[VERIFIED]** In normalized PvP modes, all players operate under a shared enchantment budget — a cap on total enchantment power applied to equipment. Players below the cap operate at their actual total. Players above the cap are scaled to the ceiling.

**[PROPOSED]** The budget equalizes total enchantment power only, not enchantment combination choice. Diversity within the budget is preserved.

---

## Combat Scalars (PROPOSED)

**[VERIFIED as PROPOSED]** The following combat scalars are design candidates for normalized PvP modes. Subject to balance review.

| Property | Proposed Scalar | Rationale |
|---|---|---|
| Vitality | ×0.70 | Reduces match length to reward skill expression over endurance |
| Regional Structure | ×1.35 | Amplifies body-region play so limb targeting decisions matter more in PvP |
| Healing | ×0.70 | Prevents healing from negating damage; maintains pressure |
| Hard Control | Progressive DR curve | Prevents lockout chains that remove player agency |

**Rationale detail:**

**Vitality ×0.70:** Shorter effective health pools make combat decisions more decisive. The GelFlow body-region system is more meaningful when each hit has proportionally greater impact.

**Regional Structure ×1.35:** In PvP, structural integrity of specific body regions is the key decision variable. A ×1.35 scalar ensures body-region play is the dominant strategic layer without making individual hits instantly disabling.

**Healing ×0.70:** Full PvE healing effectiveness in PvP creates scenarios where healers negate entire engagement windows. ×0.70 preserves healing as meaningful while ensuring sustained damage produces progressive results.

**Hard Control DR:** First application at 100% duration. Each subsequent application within a time window reduces duration on a progressive curve. Resets after sufficient time without hard control application. Exact curve values to be determined by balance testing.

**[ASSUMPTION]** These scalars apply uniformly across all normalized PvP modes. Mode-specific adjustments may be applied after play testing.

---

## Limb Damage in PvP

**[VERIFIED]** Permanent limb loss does not occur in PvP matches. All body-region states reset at match end.

**How It Works [PROPOSED]:**
- Limb damage operates on the same physical logic as PvE.
- Body-region states (including limb detachment) persist for the remainder of the match in which they occur.
- Upon match end, all body-region states reset to pre-match condition. No carry-over.

**Rationale:** Permanent PvP limb loss would create progression punishment from PvP — directly violating the no-mandatory-Malady principle and creating competitive disparity. GelFlow consequences are preserved within-match; permanent consequences are not.

**Display:** Body-region HUD displays the player character's regional status. Opponent-visible state indicators do not expose exact structural values. See [UI/UX and Accessibility](../ux/UI_UX_AND_ACCESSIBILITY.md).

---

## Status Effect Diminishing Returns

**[VERIFIED]** Hard control status effects apply diminishing returns in PvP to prevent lockout chains.

**[PROPOSED]** DR system:

**Hard Control** (stagger, knock-down, pin, displacement):
- First application: 100% duration.
- Second application within window: 60% duration.
- Third application: 30% duration.
- Fourth and beyond: minimal floor duration.
- Reset window: time without hard control sufficient to reset counter. Exact timing pending balance.

**Soft Control** (slows, reduced input response, regional debuffs):
- Less aggressive DR curve. DR activates on sustained stacking past a threshold.

**Damage-over-time** (Sour, Heat, Cold, Shock):
- No DR on damage rate. DR on duration extension only when multiple sources stack.

**[PROPOSED]** Players can see their own DR state. Opponents see status effect visual feedback duration but not the exact DR counter.

---

## Enchantment Budget System

**[VERIFIED]** A shared enchantment budget applies in all normalized PvP modes.

**[PROPOSED]** Budget mechanics:
- Each gear piece has an enchantment value (sum of enchantments applied).
- Total across all equipped gear is the player's enchantment total.
- The PvP budget ceiling defines maximum effective enchantment total.
- Players at or below ceiling operate at actual total. Players above ceiling are scaled to the ceiling.

**What the budget preserves:** Diversity of enchantment combination within the budget. Players retain their chosen build — only total power is capped.

**What the budget prevents:** Rare-enchantment categorical advantage. Paid-for enchantment advantage. Build collapse toward "most enchantment" rather than "best combination."

---

## Malady in PvP

**[VERIFIED]** Malady is not mandatory in PvP. Players with no active Malady conditions can fully participate in all PvP modes.

**[PROPOSED]** Malady by mode:

**Ranked Arena and Battlegrounds:** Malady conditions tournament-adjusted. Conditions providing systemic advantage are scaled. Self-inflicted challenges are respected but capped to prevent irrelevant character states from causing match imbalance.

**Open Ascension:** Malady operates at full effect.

**Ranked Duels:** Same as Ranked Arena.

**Exhibition Duels:** Player-configurable. Both parties may agree to any Malady treatment.

**Shattercrown:** Malady operates at full effect, consistent with Open Ascension philosophy.

**[PROPOSED]** Players can view their Malady state and adjustment before entering normalized PvP queue.

---

## Legacy Points in Ranked

**[VERIFIED]** Legacy points effective at 20% in ranked normalized PvP.

**[PROPOSED]** In normalized modes, legacy point investment provides a 20%-weighted contribution to normalized stat totals. A player with maximum legacy has a measurable but bounded bonus relative to a player with none. This bonus is within the range that player skill on either side can overcome. Legacy points are earned through play — not purchasable.

**Design Intent:** Consistent engagement is rewarded without creating mandatory-grind requirements for PvP competitiveness.

---

## Anti-Exploit Provisions

**[PROPOSED]**

**Spawn protection:** Short protection period on entering or returning to a match. Ends on aggressive action or timer.

**No spawn camping:** Respawn positions varied and protected.

**Disconnect handling:** Disconnect from ranked match records a loss. Systematic disconnect abuse is tracked.

**No infinite control:** Diminishing returns on hard control documented above.

**No hidden level matchmaking:** **[VERIFIED]** Players see approximate opponent progression tier before committing to a match.

**Anti-griefing in duels:** Repeated challenges to the same player within a short window are gated.

**Server authority:** Combat mathematics resolved server-side. See technical authority documentation.

**[PROTECTED]** Specific anti-cheat signatures and detection methodologies are not disclosed publicly.

---

## Consent Systems

**[VERIFIED]** All PvP modes require consent. No player is placed in PvP combat without explicitly or implicitly accepting that mode's terms.

| Mode | Consent Type |
|---|---|
| Duels | Active per-duel acceptance |
| Ranked Arena | Account-level opt-in by queuing |
| Open Ascension | Explicit opt-in per session/event |
| Battlegrounds | Account-level opt-in by queuing |
| Guild Wars | Guild leadership mutual agreement |
| Shattercrown | Explicit entry consent + minimum level gate |
| PvPvE Invasions | Account-level setting (separate for invader and defender) |

**[PROPOSED]** Consent settings stored at account level, changeable outside active matches. Changes do not take effect mid-match.

---

## Level Fairness Mechanisms

**[VERIFIED]** No player wins or loses PvP matches primarily because of level difference.

**Normalization:** Full normalization in all ranked and structured modes.

**No hidden level matchmaking:** Players see opponent tier before commitment.

**Open Ascension transparency:** Explicitly full-progression — players who enter know this.

**Bracket matching:** Ranked Arena brackets match players within division tiers.

**Entry requirements:** Minimum level ensures a sufficient character foundation to express meaningful choices.

**[DERIVED]** Any new feature that would create level-derived PvP advantage requires explicit design review against this commitment before implementation.

---

## Rating and Season Structure

### Rating System
**[PROPOSED]** Rating tracked within each Ranked division. Points earned on wins, lost on losses. Point differential influenced by opponent division position and match performance metrics.

Rating adjusts division placement through promotion/demotion thresholds. Division floors have a grace period preventing demotion on first match after promotion.

### Divisions
**[VERIFIED]** Ten divisions from Copper to Unbound:
1. Copper (10–19)
2. Bronze (20–29)
3. Iron (30–39)
4. Steel (40–49)
5. Heroic (50–59)
6. Mithril (60–69)
7. Legendary (70–80)
8. Mythic (81–90)
9. Apex (91–100)
10. Unbound (future)

### Season Structure
**[PROPOSED]**
- Season end date known to players in advance.
- At season end: partial rating reset — carry-over percentage prevents arbitrary reset trauma.
- Season rewards are cosmetic only (titles, visual effects, mount appearances).
- Historical season achievements preserved permanently.
- Season cosmetics are not re-offered in later seasons and are not purchasable — earn-only.

### Rank Decay
**[PROPOSED]** Extended inactivity within a season causes slow rating decay toward division median. Slow enough to not punish breaks; fast enough to prevent rating squatting.

---

## Related Documents

- [Shattercrown](./SHATTERCROWN.md)
- [Arenas and Matchmaking](./ARENAS_AND_MATCHMAKING.md)
- [Weekly Events](./WEEKLY_EVENTS.md)
- [World Regions](../world/WORLD_REGIONS.md)
- [Royal Courts Public Catalog](../world/ROYAL_COURTS_PUBLIC_CATALOG.md)
- [UI/UX and Accessibility](../ux/UI_UX_AND_ACCESSIBILITY.md)
- [Live Operations and Monetization](../liveops/LIVE_OPERATIONS_AND_MONETIZATION.md)
