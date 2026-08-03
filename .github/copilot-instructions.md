# GitHub Copilot Instructions

## Project

GUMFALL is a third-person physical action RPG involving living gummy creatures,
localized body integrity, directional weapon combat, and anatomy-driven monsters.

## Current Phase

The repository is in preproduction. Do not select a game engine, networking stack,
programming language, persistence system, or deployment platform without an
explicit accepted architecture decision.

## Rules

- Preserve deterministic authoritative gameplay behavior.
- Keep simulation separate from visual presentation.
- Treat armor and damage as body-region specific.
- Do not replace physical mechanics with generic health-bar abstractions.
- Keep loot grounded in actual monsters, factions, equipment, and ecology.
- Do not expose exact secret areas, hidden-level requirements, maze solutions,
  unreleased content, or protected loot configurations in public files.
- Do not fabricate test, build, performance, or implementation results.
- Prefer small, reviewable changes.
- Record assumptions and unresolved decisions.
- Do not modify protected private-design files.
- Do not add dependencies without documenting the reason and tradeoffs.

## Near-Term Priority

Produce a reviewable vertical-slice specification before beginning production
implementation.
