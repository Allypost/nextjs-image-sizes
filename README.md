Project to test Next.js docker build sizes

The repository is the result of running
`npx create-next-app@latest --typescript --tailwind --eslint --app --src-dir --import-alias "@/*" --use-npm`

## Tests
Currently, these Dockerfile versions are tested:
 - `Dockerfile.node`
 - `Dockerfile.alpine-node`
 - `Dockerfile.node-alpine`

Images are built with the following commands:

`docker build -t <IMAGE_NAME> --compress --file <DOCKERFILE_PATH> .`

or by running the `build.sh` helper script.

## Results

```
Image sizes:
  Dockerfile.alpine-node: 93M
  Dockerfile.node: 1.2G
  Dockerfile.node-alpine: 173M
```
