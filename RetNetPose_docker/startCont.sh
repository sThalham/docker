#!/bin/bash

sudo nvidia-docker build --no-cache -t retnetpose_gpu0 .
thispid=$(sudo -E NV_GPU=0 nvidia-docker run --name=retnetpose_gpu0 -t -d -v ~/data/retnet_test:/eagleeye/data -v ~/data/linemod1/coco_val2014:/eagleeye/data/images/val2017 -v ~/data/linemod1/annotations/instances_val2014.json:/eagleeye/data/annotations/instances_val2017.json -p 4000:80 retnetpose_gpu0)
sudo nvidia-docker exec -it $thispid bash

sudo nvidia-docker container kill $thispid
sudo nvidia-docker container rm $thispid


