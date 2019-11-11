#!/bin/bash

sudo nvidia-docker build --no-cache -t retnetpose_gpu .
thispid=$(sudo -E NV_GPU=0 nvidia-docker run --network=host --name=retnetpose_gpu -t -d -v ~/data/train_data/tless_3DBox:/RetNetPose/data retnetpose_gpu)

#sudo nvidia-docker exec -it $thispid bash

#sudo nvidia-docker container kill $thispid
#sudo nvidia-docker container rm $thispid


