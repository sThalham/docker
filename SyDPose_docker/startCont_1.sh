#!/bin/bash

sudo nvidia-docker build --no-cache -t retnetpose_gpu1 .
thispid=$(sudo -E NV_GPU=1 nvidia-docker run --network=host --name=retnetpose_titan -t -d -v ~/linemod_RGBD:/RetNetPose/data -v ~/val_linemod_RGBD:/RetNetPose/val retnetpose_gpu1)

#sudo nvidia-docker exec -it $thispid bash

#sudo nvidia-docker container kill $thispid
#sudo nvidia-docker container rm $thispid


