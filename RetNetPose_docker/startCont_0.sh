#!/bin/bash

sudo nvidia-docker build --no-cache -t retnetpose_gpu .
thispid=$(sudo -E NV_GPU=0 nvidia-docker run --network=host --name=retnetpose_gpu -t -d -v ~/linemod_RGBD:/RGBPose/data -v ~/val_linemod_RGBD:/RGBDPose/val retnetpose_gpu)

#sudo nvidia-docker exec -it $thispid bash

#sudo nvidia-docker container kill $thispid
#sudo nvidia-docker container rm $thispid


