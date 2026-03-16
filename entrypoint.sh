#!/bin/sh
set -eu

S3_CONFIG_PATH="${SEAWEED_S3_CONFIG:-/etc/seaweedfs/s3.json}"
DATA_DIR="${SEAWEED_DATA_DIR:-/data}"
VOLUME_MAX="${SEAWEED_VOLUME_MAX:-30}"

if [ ! -f "$S3_CONFIG_PATH" ]; then
  echo "[sargaco-monstro] missing S3 config file: $S3_CONFIG_PATH" >&2
  exit 1
fi

if [ ! -d "$DATA_DIR" ]; then
  mkdir -p "$DATA_DIR"
fi

echo "[sargaco-monstro] starting SeaweedFS"
echo "[sargaco-monstro] s3_config=$S3_CONFIG_PATH data_dir=$DATA_DIR volume_max=$VOLUME_MAX"

exec weed server \
  -s3 \
  -s3.config="$S3_CONFIG_PATH" \
  -dir="$DATA_DIR" \
  -volume.max="$VOLUME_MAX"
