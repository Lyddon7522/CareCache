# CareCache site

Static Astro site for CareCache product information, support, privacy, and terms. It has no
analytics, cookies, account system, forms, or remote assets.

Requires Node.js 22.19.0 or newer and npm.

```sh
npm ci
npm run verify
```

Set `SITE_URL` for canonical URLs and sitemap generation. `PUBLIC_REPOSITORY_URL` can override the
future public repository link before deployment.
