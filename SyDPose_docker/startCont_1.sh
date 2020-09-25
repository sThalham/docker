#!/bin/bash

sudo nvidia-docker build --no-cache -t sydpose_gpu .
thispid=$(sudo -E NV_GPU=1 nvidia-docker run --network=host --name=sydpose_gpu -t -d -v ~/ycbv_train:/SyDPose/data sydpose_gpu)

#sudo nvidia-docker exec -it $thispid bash

#sudo nvidia-docker container kill $thispid
#sudo nvidia-docker container rm $thispid


