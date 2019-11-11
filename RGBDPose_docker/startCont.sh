#!/bin/bash

sudo nvidia-docker build --no-cache -t rgbdpose_gpu .
thispid=$(sudo -E NV_GPU=0 nvidia-docker run --network=host --name=rgbdpose_gpu -t -d -v ~/data/train_data/linemod_RGBD:/RGBDPose/data -v ~/data/train_data/val_linemod_RGBD:/RGBDPose/val rgbdpose_gpu)

#sudo nvidia-docker exec -it $thispid bash

#sudo nvidia-docker container kill $thispid
#sudo nvidia-docker container rm $thispid


