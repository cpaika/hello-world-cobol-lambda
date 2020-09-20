#!/bin/bash
rm -rf lib
rm hello
docker build -t cobol-builder .
docker create --name cobol cobol-builder:latest
docker cp cobol:/app/hello .
docker cp cobol:/app/lib .
docker rm cobol