# ETEC Frontend

Frontend for ETEC, built with [Nuxt 4](https://nuxt.com).

## Requirements

- Node.js 20+
- npm

## Getting Started

```bash
git clone https://github.com/knr-smey/etec-frontend.git
cd etec-frontend
npm install
```

## Development Server

Start the dev server on `http://localhost:3000`:

```bash
npm run dev
```

## Project Structure

This project uses Nuxt 4's directory conventions:

```
app/
  assets/       # CSS, images
  components/   # Vue components
  composables/  # Reusable composition-API logic
  layouts/      # Page layouts
  middleware/   # Route middleware
  pages/        # File-based routes
  plugins/      # Nuxt plugins
  utils/        # Client/app-side utility functions
  app.vue       # Root component

server/
  api/          # API routes (Nitro)
  middleware/   # Server middleware
  utils/        # Server-side utility functions

shared/
  types/        # Types shared between app and server
  utils/        # Utilities shared between app and server

public/         # Static files served as-is
```

## Production

Build for production:

```bash
npm run build
```

Preview the production build locally:

```bash
npm run preview
```

See the [Nuxt deployment docs](https://nuxt.com/docs/getting-started/deployment) for more.
