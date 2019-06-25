#!/bin/bash

sudo nvidia-docker build --no-cache -t cyclegan_gpu0 .
thispid=$(sudo -E NV_GPU=0 nvidia-docker run --name=cyclegan_gpu0 -t -d -v ~/workspace/cyclegan/datasets:/cycleGAN/datasets -p 4000:80 cyclegan_gpu0)

#sudo nvidia-docker exec -it $thispid bash

#sudo nvidia-docker container kill $thispid
#sudo nvidia-docker container rm $thispid


