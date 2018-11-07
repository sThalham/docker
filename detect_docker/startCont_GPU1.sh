#!/bin/bash

sudo nvidia-docker build --no-cache -t detectronmod_gpu1 .
thispid=$(sudo -E NV_GPU=1 nvidia-docker run --name=detectronmod_gpu1 -t -d -v ~/data/lm_synthetic:/detectron/detectron/datasets/data/coco -p 5000:80 detectronmod_gpu1)
#thispid=$(sudo -E NV_GPU=1 nvidia-docker run --name=detectronmod_gpu1 -t -d -v ~/data/lm_std:/detectron/detectron/datasets/data/coco -v ~/data/linemod1/coco_val2014:/detectron/detectron/datasets/data/coco/coco_val2014 -v ~/data/linemod1/annotations/instances_val2014.json:/detectron/detectron/datasets/data/coco/annotations/instances_val2014.json -p 5000:80 detectronmod_gpu1)
sudo nvidia-docker exec -it $thispid /bin/bash
sudo nvidia-docker container kill $thispid
sudo nvidia-docker container rm $thispid
