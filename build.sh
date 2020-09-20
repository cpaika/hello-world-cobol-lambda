#!/bin/bash
# Reset any local files
rm -rf lib
rm hello
# Build the binary in the amazon linux 2 container
docker build -t cobol-builder .
docker create --name cobol cobol-builder:latest
# Copy the built binary and library
docker cp cobol:/app/hello .
docker cp cobol:/app/lib .
docker rm cobol