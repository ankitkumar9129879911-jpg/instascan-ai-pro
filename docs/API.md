# API reference

| Method | Endpoint | Purpose |
|---|---|---|
| GET | /api/health | Health check |
| GET | /api/auth/instagram | Begin Meta OAuth |
| GET | /api/auth/instagram/callback | Validate OAuth state and store encrypted token |
| GET | /api/auth/status | Connection metadata, no token values |
| DELETE | /api/auth/instagram | Disconnect account |
| GET | /api/analytics/overview | Authorized profile, media and available account insights; demo fallback |

Live metrics depend on the Meta app's permissions and account eligibility. Tokens are never returned to the browser.