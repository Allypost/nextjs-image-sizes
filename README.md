Project to test Next.js docker build sizes

Currently, these dockerfile versions are tested (Linux X86):
 - Dockerfile.alpine-node (`172MB`)
 - Dockerfile.node-alpine (`92.6MB`)

Images are built with the following commands:

`docker build -t <IMAGE_NAME> --compress --file <DOCKERFILE_PATH> .`
