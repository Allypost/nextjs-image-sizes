#!/usr/bin/env bash

set -eo pipefail

if [ -n "${DEBUG:-}" ]; then
  set -x
fi

declare -a docker_image_sizes=()

for f in Dockerfile.*; do
  echo "Building $f"
  filename="$(basename -- "$f")"
  extension="${filename##*.}"
  image_name="nextjs-test-${extension}"

  docker build -t "$image_name" --compress --file "$f" .

  image_size="$(docker image inspect --format '{{.Size}}' "$image_name" | numfmt --to=si)"
  docker_image_sizes+=("$f: $image_size")
done

echo -ne "\n\n\n"
echo 'Image sizes:'
for res in "${docker_image_sizes[@]}"; do
  echo "  ${res}"
done
