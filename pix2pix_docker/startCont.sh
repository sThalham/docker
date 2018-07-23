#!/bin/bash

sudo nvidia-docker build --no-cache -t pix2pixmod_gpu0 .
<<<<<<< HEAD
thispid=$(sudo -E NV_GPU=0 nvidia-docker run --name=pix2pixmod_gpu0 -t -d -v ~/data/linemodRendered:/pix2pix/datasets/linemodRendered -v ~/data/linemodRendered/saved_model:/pix2pix/saved_model -p 4000:80 pix2pixmod_gpu0)
=======
thispid=$(sudo -E NV_GPU=0 nvidia-docker run --name=pix2pixmod_gpu0 -t -d -v ~/data/GAN_data/linemodRendered:/pix2pix/datasets/linemodRendered /data/GAN_data/linemodRendered/saved_model:/pix2pix/saved_model -p 4000:80 pix2pixmod_gpu0)
>>>>>>> 56236728dab772046e7a5f0a49eb581f0612d159
sudo nvidia-docker exec -it $thispid bash

sudo nvidia-docker container kill $thispid
sudo nvidia-docker container rm $thispid


