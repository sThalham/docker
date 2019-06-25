#!/bin/bash

sudo nvidia-docker build --no-cache -t retnetpose_gpu1 .
thispid=$(sudo -E NV_GPU=1 nvidia-docker run --network=host --name=retnetpose_gpu1 -t -d -v ~/data/fronius:/RetNetPose/data retnetpose_gpu1)

#sudo nvidia-docker exec -it $thispid bash

#sudo nvidia-docker container kill $thispid
#sudo nvidia-docker container rm $thispid


