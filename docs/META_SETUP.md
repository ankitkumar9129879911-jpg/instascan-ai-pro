# Meta developer setup

1. Create a Meta developer app and enable the Instagram API / Facebook Login use case supported by your app.
2. Add META_REDIRECT_URI exactly to the app's valid OAuth redirect URIs.
3. Configure the permissions available for your product: instagram_basic, instagram_manage_insights, pages_show_list and pages_read_engagement. Meta review / Advanced Access may be needed.
4. Use a Business or Creator Instagram account linked to a Facebook Page.
5. Set META_APP_ID, META_APP_SECRET, META_REDIRECT_URI, META_GRAPH_VERSION and TOKEN_ENCRYPTION_KEY. Generate the 32-byte key using `openssl rand -hex 32`.
6. Set a strong SESSION_SECRET and HTTPS in production.

Metric availability varies by account, media type, API version, permission and reporting window. The current backend retrieves profile and media and attempts a subset of account insights. It does not implement per-post insights, scheduled token refresh, multi-user tenancy or a PostgreSQL adapter. Verify current Meta documentation and app review requirements before production.