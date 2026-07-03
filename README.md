# Iron Burrow WWW

Iron Burrow is a small static marketing site for the Iron Burrow private Beta.

**Compliance evidence layer for crypto teams.**

The site is built with Zola and intentionally avoids npm, npx, Node, `package.json`, JavaScript build tooling, and frontend framework dependencies.

## Requirements

- Zola

## Local development

Run the local development server:

```bash
zola serve
```

Build the static site:

```bash
zola build
```

Zola writes the generated site to `public/`.

## Cloudflare Pages

Expected Cloudflare Pages settings:

```txt
Framework preset: Zola
Build command: zola build
Build output directory: public
```

Optional preview-safe build command:

```bash
if [ "$CF_PAGES_BRANCH" = "main" ]; then zola build; else zola build --base-url "$CF_PAGES_URL"; fi
```

## No npm constraint

This repository intentionally does not use:

- npm
- npx
- Node
- `package.json`
- npm scripts
- JavaScript build tooling
- Astro, React, Docusaurus, Vite, or Tailwind

JavaScript may be added later only as a browser-side island for OpenAPI documentation rendering. It is not part of this foundation.

## Future OpenAPI integration

The generated Mother API OpenAPI artifact should eventually live at:

```txt
/openapi/mother-api.json
```

The `/api/` page currently includes only a clean placeholder. No Scalar, Redoc, Swagger UI, CDN script, or OpenAPI renderer is integrated yet.
