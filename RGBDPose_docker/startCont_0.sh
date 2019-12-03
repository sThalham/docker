#!/bin/bash

sudo nvidia-docker build --no-cache -t rgbdpose_gpu_0 .
thispid=$(sudo -E NV_GPU=0 nvidia-docker run --network=host --name=rgbdpose_gpu_0 -t -d -v ~/linemod_RGBD:/RGBDPose/data -v ~/val_linemod_RGBD:/RGBDPose/val rgbdpose_gpu_0)

#sudo nvidia-docker exec -it $thispid bash

#sudo nvidia-docker container kill $thispid
#sudo nvidia-docker container rm $thispid


