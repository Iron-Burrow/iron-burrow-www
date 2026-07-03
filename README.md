# Iron Burrow WWW

Public website for Iron Burrow.

Iron Burrow is a compliance evidence layer for crypto teams. This site is built with Zola and kept intentionally simple.

There is no npm, Node framework, `package.json`, Swagger UI, or analytics setup in this repo. The API reference page loads Redoc from its CDN.

## Requirements

- Zola installed locally

## Local development

```bash
zola serve
```

## Production build

```bash
./scripts/build-zola.sh
```

Zola writes the generated site to `public/`.

Set `SITE_URL` to override the generated site URL:

```bash
SITE_URL="https://iron-burrow-www.jose-skedar.workers.dev" ./scripts/build-zola.sh
```

To confirm the public API artifact is present after a build:

```bash
test -f public/openapi/mother-api.json
```

## OpenAPI artifact flow

`static/openapi/mother-api.json` is the public Mother API artifact.

The Zola build copies it to:

```txt
public/openapi/mother-api.json
```

Today the artifact is maintained manually from the Mother API source repository. Later it may be generated automatically from the Mother API repository.

## Cloudflare Workers

Expected Cloudflare Workers settings:

```txt
Build command: ./scripts/build-zola.sh
Deploy command: npx wrangler deploy --assets ./public
```
