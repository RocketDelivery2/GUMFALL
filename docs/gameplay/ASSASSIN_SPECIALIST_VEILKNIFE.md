# Veilknife Assassin Specialist

**Status:** PROPOSED
**Base family:** Rogue / Shadow

## Fantasy

The Veilknife is a patient infiltrator who trades safety for exceptional positional lethality. It studies a target, enters cloak outside hard detection, reaches the rear arc, commits to a dagger strike, and must escape if the attempt fails.

## Resources

### Veil

Cloak stability. It weakens through sprinting, bright light, noise, close enemy proximity, damage, attacks, and protected interactions.

### Nerve

Assassination focus. It rises while observing an unaware target and maintaining a clean approach. It falls under damage, crowd pressure, or detection.

## Backstab requirements

A valid backstab requires:

- dagger-family weapon;
- eligible target;
- rear arc;
- line of sight;
- attack range;
- attacker not hard-detected;
- cloak or an authored opening state;
- authoritative timing and target state.

## Conditional assassination

An unaware normal or elite monster may be defeated in one hit when:

- it is explicitly `AssassinationEligible`;
- the rear-arc, range, line-of-sight, and detection checks pass;
- dagger lethality meets assassination resilience;
- it is not a player, boss, royal, world-event target, quest-critical actor, or protected named encounter;
- the server validates the complete state.

Suggested model:

`Lethality = DaggerPower + Skill + Nerve + Position + TargetExposure`

`Resistance = Resilience + LevelGapPenalty + Armor + Alertness`

Higher-level targets increase detection, resilience, nearby aggro, and failure risk. Level gap never overrides a protected target category.

## Near success

A result close to the lethality threshold produces heavy damage and a short visible second-strike window. The follow-up must still connect and pass normal rules.

## Failure

Failed assassination:

- breaks cloak;
- applies Exposure;
- alerts the target;
- sends an aggro pulse to nearby allies;
- reduces immediate recloak effectiveness;
- leaves the Assassin in danger behind the target.

## Pickpocket

Pickpocket uses server-authored NPC loot tables. It can yield coins, keys, clues, maps, bait, letters, or minor consumables.

It never:

- removes items from another player's inventory;
- steals paid currency;
- steals Malady;
- bypasses quest-critical protections;
- repeats infinitely on one target;
- trusts a client-reported result.

Failure raises suspicion or alarm and records an authoritative attempt.

## Abilities

- Softstep
- Veil
- Study Mark
- Backstab
- Mercy Cut
- Pocket Thread
- Shadow Slip
- False Footfall
- Smoke Sugar
- Last Nerve

## PvP

- no one-shot assassination;
- normalized burst cap;
- readable cloak/detection cues;
- protected spawn and zone-transition areas;
- pickpocket disabled against players;
- diminishing returns for repeated control.

## Required telemetry/tests

Track eligibility, rear arc, distance, line of sight, detection, level gap, lethality, resistance, result, second-strike conversion, nearby aggro, pickpocket cooldown, and impossible positional successes.
