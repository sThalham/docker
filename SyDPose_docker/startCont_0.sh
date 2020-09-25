#!/bin/bash

sudo nvidia-docker build --no-cache -t sydpose_gpu_0 .
thispid=$(sudo -E NV_GPU=0 nvidia-docker run --network=host --name=sydpose_gpu_0 -t -d -v ~/ycbv_train:/SyDPose/data sydpose_gpu_0)

#sudo nvidia-docker exec -it $thispid bash

#sudo nvidia-docker container kill $thispid
#sudo nvidia-docker container rm $thispid


