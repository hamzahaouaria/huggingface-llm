#!/bin/bash

model=HuggingFaceH4/zephyr-7b-beta
# share a volume with the Docker container to avoid downloading weights every run
volume=$PWD/data

docker run --gpus '"device=0"' --shm-size 1g -p 8182:80 -v $volume:/data \
    ghcr.io/huggingface/text-generation-inference:2.4.0 --model-id $model