#!/bin/bash

sudo nvidia-docker build --no-cache -t rgbdpose_gpu_1 .
thispid=$(sudo -E NV_GPU=1 nvidia-docker run --network=host --name=rgbdpose_gpu_1 -t -d -v ~/linemod_RGBD_V1:/DoublePose/data -v ~/linemod_RGBD_val:/DoublePose/val rgbdpose_gpu_1)

#sudo nvidia-docker exec -it $thispid bash

#sudo nvidia-docker container kill $thispid
#sudo nvidia-docker container rm $thispid


