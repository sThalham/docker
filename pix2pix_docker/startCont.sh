#!/bin/bash

repo=p2p_train_10k 

sudo nvidia-docker build --no-cache -t pix2pixmod_gpu0 .
thispid=$(sudo -E NV_GPU=0 nvidia-docker run --name=pix2pixmod_gpu0 -t -d -v ~/data/$repo/datasets:/pix2pix/datasets/$repo -v ~/data/$repo/saved_model:/pix2pix/saved_model -v ~/data/$repo/images:/pix2pix/images -v ~/data/$repo/results:/pix2pix/results -p 4000:80 pix2pixmod_gpu0)

sudo nvidia-docker exec -it $thispid bash

sudo nvidia-docker container kill $thispid
sudo nvidia-docker container rm $thispid


