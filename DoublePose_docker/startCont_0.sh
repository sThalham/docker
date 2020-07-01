#!/bin/bash

sudo nvidia-docker build --no-cache -t doublepose_gpu_0 .
thispid=$(sudo -E NV_GPU=0 nvidia-docker run --network=host --name=doublepose_gpu_0 -t -d -v ~/linemod_RGBD_V1:/DoublePose/data -v ~/linemod_RGBD_val:/DoublePose/val doublepose_gpu_0)

#sudo nvidia-docker exec -it $thispid bash

#sudo nvidia-docker container kill $thispid
#sudo nvidia-docker container rm $thispid


