# rembg-service

Self-hosted [rembg](https://github.com/danielgatis/rembg) background-removal HTTP API,
deployed on Coolify and shared across all apps.

The image is just the official `danielgatis/rembg` with its default command overridden
to launch the HTTP server (`rembg s`) on port 7000. The u2net model is baked into the
base image, so no volume or download is needed at runtime.

## API

- Docs / OpenAPI UI: `GET /api`
- Remove background (GET): `GET /api/remove?url=<image-url>`
- Remove background (POST): `POST /api/remove` with `file` upload

Protected by HTTP Basic Auth at the proxy layer.
