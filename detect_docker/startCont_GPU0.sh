#!/bin/bash

sudo nvidia-docker build --no-cache -t detectronmod_gpu0 .
thispid=$(sudo -E NV_GPU=0 nvidia-docker run --name=detectronmod_gpu0 -t -d -v ~/data/lm_std_m5o5:/detectron/detectron/datasets/data/coco -v ~/data/linemod1/coco_val2014:/detectron/detectron/datasets/data/coco/coco_val2014 -v ~/data/linemod1/annotations/instances_val2014.json:/detectron/detectron/datasets/data/coco/annotations/instances_val2014.json -p 6000:70 detectronmod_gpu0)
sudo nvidia-docker exec -it $thispid /bin/bash
sudo nvidia-docker container kill $thispid
sudo nvidia-docker container rm $thispid
