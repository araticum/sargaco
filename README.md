# sargaco-monstro

Imagem derivada do SeaweedFS para o stack do Monstro.

## Objetivo

Evitar fragilidade operacional no Portainer causada por bind mount de `s3.json`.
A imagem já carrega:

- `entrypoint.sh` próprio
- `s3.json` embutido
- defaults estáveis para o Monstro

## Build local

```bash
docker build -t sargaco-monstro:local .
```

## Exemplo de uso no compose

```yaml
sargaco:
  image: ghcr.io/araticum/sargaco-monstro:latest
  container_name: monstro-sargaco
  restart: unless-stopped
  ports:
    - "${SEAWEEDFS_S3_PORT:-8333}:8333"
    - "${SEAWEEDFS_HTTP_PORT:-8080}:8080"
  environment:
    - SEAWEED_VOLUME_MAX=${SEAWEED_VOLUME_MAX:-30}
  volumes:
    - sargaco-data:/data
  networks: [monstro-net]
```

## Variáveis opcionais

- `SEAWEED_S3_CONFIG` (default `/etc/seaweedfs/s3.json`)
- `SEAWEED_DATA_DIR` (default `/data`)
- `SEAWEED_VOLUME_MAX` (default `30`)
