#!/bin/bash

sudo docker build --no-cache -t rgbdpose_gpu_1 .
thispid=$(sudo docker run --gpus device=1 --network=host --name=rgbdpose_gpu_1 -t -d -v ~/linemod_PBR_BOP:/RGBDPose/data -v ~/linemod_RGBD_val:/RGBDPose/val -v ~/Meshes:/RGBDPose/Meshes rgbdpose_gpu_1)

#sudo nvidia-docker exec -it $thispid bash

#sudo nvidia-docker container kill $thispid
#sudo nvidia-docker container rm $thispid


