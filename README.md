# Iron Burrow WWW

Public website for Iron Burrow.

Iron Burrow is a compliance evidence layer for crypto teams. This site is built with Zola and kept intentionally simple.

There is no npm, npx, Node, `package.json`, JavaScript framework, Swagger UI, Redoc, or analytics setup in this repo.

## Requirements

- Zola installed locally

## Local development

```bash
zola serve
```

## Production build

```bash
zola build
```

Zola writes the generated site to `public/`.

To confirm the public API artifact is present after a build:

```bash
test -f public/openapi/mother-api.json
```

## OpenAPI artifact flow

`static/openapi/mother-api.json` is the public Mother API artifact.

`zola build` copies it to:

```txt
public/openapi/mother-api.json
```

Today the artifact is maintained manually from the Mother API source repository. Later it may be generated automatically from the Mother API repository.

## Cloudflare Pages

Expected Cloudflare Pages settings:

```txt
Framework preset: Zola
Build command: zola build
Build output directory: public
Production branch: master
```
