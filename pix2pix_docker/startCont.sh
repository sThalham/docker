#!/bin/bash

sudo nvidia-docker build --no-cache -t pix2pixmod_gpu0 .
thispid=$(sudo -E NV_GPU=0 nvidia-docker run --name=pix2pixmod_gpu0 -t -d -v ~/data/GAN_data/linemodRendered:/pix2pix/datasets/linemodRendered /data/GAN_data/linemodRendered/saved_model:/pix2pix/saved_model -p 4000:80 pix2pixmod_gpu0)
sudo nvidia-docker exec -it $thispid bash

sudo nvidia-docker container kill $thispid
sudo nvidia-docker container rm $thispid


