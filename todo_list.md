# TODO List

#TODO project planning

# TODO List

## High Priority

- [ ] Scryfall module - build card data fetching and database with tags
  - **Why**: Need to search through cards to find and categorize what to include in decks. Must be able to filter by colors, types, abilities, costs, and tags for deckbuilding workflows.

- [ ] Rules module - import and parse MTG rulebook with keyword understanding
  - **Why**: LLMs need accurate rules context to understand card interactions, timing, and illegal plays. Must parse the comprehensive rules for proper goldfish simulation and synergy detection.

- [ ] LLM workflow system - generate and execute code for deckcrafting
  - **Why**: Core engine that allows safe code generation and execution for goldfish simulations. LLMs should be able to write and run code to test deck interactions without manual intervention.

- [ ] Project structure setup - Python/TS with dependency management
  - **Why**: Foundation for all modules. Need proper package management, environment setup, and build pipeline before implementing any deckcrafting features.

## Medium Priority

- [ ] Goldfish simulation engine - simulate deck opening and game states
  - **Why**: Test deck consistency, combo assembly speed, and win conditions. Must simulate opening hands, draw sequences, and game states to evaluate deck performance.

- [ ] Synergy tracking - analyze card interactions and synergy stats
  - **Why**: Discover hidden interactions between cards and rank cards by synergy density. Need to understand which cards amplify each other to build focused, powerful decks.

- [ ] Ulacombo deck implementation - build out the Ulalek infinite combo deck
  - **Why**: First concrete deck to validate the system. Ulalek's stack-copying ability needs careful combo assembly tracking to go infinite with colorless Eldrazi spells.

- [ ] Recommendation system - suggest fetches and mode selections
  - **Why**: Interactive gameplay assistance. Player needs help deciding what to fetch, which modes to select, and what interaction to use during goldfish simulations or actual games.
---
Edited-by: agent glm-4.7 via opencode 2026-02-05T20:05:00Z
