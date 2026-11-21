# InstaScan AI Pro

Responsive Instagram analytics dashboard using React, Vite, Recharts, Express and SQLite. The app starts with fictional data clearly labelled DEMO MODE. Live integration uses Meta's official Graph API and authorized professional accounts only.

## Local setup
Requires Node.js 20+.

```sh
cp .env.example .env
npm install
npm install --prefix frontend
npm install --prefix backend
npm run dev
```

Open http://localhost:5173. The frontend proxies /api to the Express server on port 4000. Demo mode needs no Meta credentials.

## Meta connection
See [docs/META_SETUP.md](docs/META_SETUP.md). Configure META_APP_ID, META_APP_SECRET, META_REDIRECT_URI, SESSION_SECRET and TOKEN_ENCRYPTION_KEY in .env. Generate a 32-byte key using `openssl rand -hex 32`. Never commit .env. Set DEMO_MODE=false to disable demo fallback.

A Business or Creator Instagram account linked to a Facebook Page is required. This implementation requests instagram_basic, instagram_manage_insights, pages_show_list and pages_read_engagement. Meta app review / Advanced Access may be required.

## Commands
- `npm run dev` — frontend and backend
- `npm run build` — production frontend build
- `npm test` — automated tests
- `npm start` — backend start (see backend package scripts)

## Security
Access tokens are encrypted at rest with AES-256-GCM and never sent to the frontend. OAuth state is random and timing-safe validated. Session cookies are HTTP-only and SameSite=Lax. Helmet, CORS allowlist and rate limiting are enabled. Use HTTPS and strong secrets in production.

## Current limitations
This initial version retrieves account profile and media and attempts a subset of account insights. Metric availability depends on Meta permissions, account eligibility, API version and reporting window. Per-post insights, scheduled token refresh, multi-tenant accounts and PostgreSQL adapter are not implemented. CSV export covers loaded posts. Missing live metrics are not fabricated. Demo metrics are fictional. See [docs/API.md](docs/API.md).
