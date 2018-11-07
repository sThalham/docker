#!/bin/bash

sudo nvidia-docker build --no-cache -t retnetpose_gpu0 .
thispid=$(sudo -E NV_GPU=0 nvidia-docker run --name=retnetnose_gpu0 -t -d -p 4000:80 retnetnose_gpu0)
sudo nvidia-docker exec -it $thispid bash

sudo nvidia-docker container kill $thispid
sudo nvidia-docker container rm $thispid


