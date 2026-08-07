# Agent Guide — ETEC Frontend

Guidance for AI coding agents (Claude Code, etc.) working in this repository.

## What this project is

Frontend for ETEC, built with **Nuxt 4** (Vue 3 + Vue Router 5). It is an early-stage
scaffold: three placeholder pages, a navbar, and no state management, API integration,
tests, or linting configured yet. Treat conventions below as the intended structure,
not as a large existing codebase to reverse-engineer.

## Requirements

- Node.js 22 (see `.nvmrc`)
- npm

## Commands

```bash
npm install       # install dependencies
npm run dev        # start dev server at http://localhost:3000
npm run build       # production build
npm run preview      # preview the production build locally
npm run generate      # static site generation
```

There is currently no lint, test, or type-check script in `package.json`. If you add
tooling (ESLint, Vitest, etc.), wire it up as an npm script rather than running tools
ad hoc, and update this file.

## Project structure (Nuxt 4 conventions)

```
app/
  assets/       # CSS, images
  components/   # Vue components (auto-imported)
  composables/  # Reusable composition-API logic (auto-imported)
  layouts/      # Page layouts
  middleware/   # Route middleware
  pages/        # File-based routes
  plugins/      # Nuxt plugins
  utils/        # Client/app-side utility functions (auto-imported)
  app.vue       # Root component

server/
  api/          # API routes (Nitro server engine)
  middleware/   # Server middleware
  utils/        # Server-side utility functions

shared/
  types/        # Types shared between app and server
  utils/        # Utilities shared between app and server

public/         # Static files served as-is
```

Nuxt auto-imports components, composables, and utils under `app/` — don't hand-write
import statements for files in those directories; only explicit relative imports
(like `Navbar.vue` currently imported in [app/app.vue](app/app.vue)) are needed when
auto-import isn't in play.

## Current state (as of 2026-08-07)

- Routes: `/` ([index.vue](app/pages/index.vue)), `/about` ([about.vue](app/pages/about.vue)),
  `/course` ([course.vue](app/pages/course.vue)) — all placeholder content only.
- [Navbar.vue](app/components/Navbar.vue) is the only real component, hardcoded with
  scoped styles (dark navbar, blue active-link highlight).
- No global state (Pinia, etc.), no API calls, no `server/api` routes implemented yet.
- Styling is plain scoped CSS per-component; [main.css](app/assets/css/main.css) only
  has a minimal reset. No CSS framework or design system is wired in.
- `.gitkeep` placeholders mark directories (`composables/`, `middleware/`, `plugins/`,
  `utils/`, `server/api/`, `server/middleware/`, `server/utils/`, `shared/types/`,
  `shared/utils/`) that are scaffolded but empty — safe to fill in as needed.

## Conventions to follow

- Use `<script setup lang="ts">` with Composition API (matches [app.vue](app/app.vue)).
- Keep component styles scoped (`<style scoped>`) unless there's a reason for global CSS.
- Put shared types/utilities that both client and server need into `shared/`, not
  duplicated in both `app/` and `server/`.
- Server-side API logic belongs in `server/api/` (Nitro file-based routing), not in
  client composables.
- No abbreviated commit-style shortcuts in code — this is a small, early codebase;
  prefer straightforward, readable Vue/TS over premature abstraction.

## Gaps an agent may be asked to fill

- No ESLint/Prettier config — if asked to add linting, check current Nuxt defaults
  (`@nuxt/eslint`) before introducing a custom setup.
- No test runner — Vitest is the conventional choice for Nuxt/Vite projects if tests
  are requested.
- No CI configuration (`.github/workflows` does not exist).
- No environment variable handling yet (`.env` is gitignored and ready to use via
  Nuxt's `runtimeConfig`).
