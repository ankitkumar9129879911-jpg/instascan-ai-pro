# InstaScan AI Pro

Responsive Instagram analytics dashboard using React, Vite, Recharts, Express and SQLite. The app starts with fictional data clearly labelled DEMO MODE. Live integration uses Meta's official Graph API and authorized professional accounts only.

## Quick start (Windows, macOS or Linux)

Requires Node.js 20+.

1. Download this branch as a ZIP and extract it, or clone the repository.
2. Open a terminal in the project folder.
3. Run:

```sh
npm install
npm run setup
npm run dev
```

4. Open http://localhost:5173. The Vite development server proxies /api requests to Express on port 4000. Demo mode requires no Meta credentials.

On Windows, you can alternatively double-click `start-windows.bat` after installing Node.js. The first run installs dependencies and opens the frontend and backend in separate terminal windows.

## Install on Android

The frontend includes a web-app manifest and service worker. After deploying it over HTTPS, open the site in Chrome on Android, use the browser menu, and choose **Install app** or **Add to Home screen** if offered. This installs a home-screen web app (PWA), not a signed APK.

## Deploy a demo

A Render Blueprint is included in `render.yaml`. In Render, create a new Blueprint and select this repository and the `feat/instascan-ai-pro` branch. Render reads the configuration and builds the frontend, then serves it from the Node backend. The public demo uses fictional sample metrics; do not use it for real Instagram accounts until production session storage, database persistence, Meta credentials, and HTTPS OAuth settings are reviewed and configured.

The free hosting filesystem may be temporary. SQLite data can be lost when the service restarts or redeploys. Use a persistent disk/database and a production session store before enabling real account connections.

## Meta connection

See [docs/META_SETUP.md](docs/META_SETUP.md). Configure META_APP_ID, META_APP_SECRET, META_REDIRECT_URI, SESSION_SECRET and TOKEN_ENCRYPTION_KEY. Generate a 32-byte encryption key with `openssl rand -hex 32`. Never commit secrets or put them in frontend environment variables.

A Business or Creator Instagram account linked to a Facebook Page is required. This implementation requests instagram_basic, instagram_manage_insights, pages_show_list and pages_read_engagement. Meta app review / Advanced Access may be required.

## Commands

- `npm run setup` — install frontend and backend dependencies
- `npm run dev` — start frontend and backend together
- `npm run build` — production frontend build
- `npm test` — automated tests

## Security and current limitations

Access tokens are encrypted at rest with AES-256-GCM. OAuth state is random and timing-safe validated. Session cookies are HTTP-only and SameSite=Lax. Helmet, CORS allowlist and rate limiting are enabled. Before enabling real users, replace express-session's in-memory store with a production session store, configure persistent storage, HTTPS and strong secrets, and review npm audit findings.

This initial version retrieves account profile and media and attempts a subset of account insights. Metric availability depends on Meta permissions, account eligibility, API version and reporting window. Per-post insights, scheduled token refresh, multi-tenant accounts and PostgreSQL adapter are not implemented. Missing live metrics are not fabricated. Demo metrics are fictional. See [docs/API.md](docs/API.md).
