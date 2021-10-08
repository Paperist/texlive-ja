# Contributing

## Setting Up the Environment

https://docs.docker.com/get-docker/

## How to try the image built by Dockerfile locally

This project requires [Buildx](https://docs.docker.com/buildx/working-with-buildx/).

```
git clone https://github.com/Paperist/texlive-ja.git
cd texlive-ja/debian
# Edit Dockerfile
docker buildx build . -t texlive-ja:debian
docker run -it -v $(pwd):/workdir texlive-ja:debian
```

## How to check if the Dockerfile would build on all the supported platform

Just create a pull request and GitHub Actions will check that on behalf of you.
