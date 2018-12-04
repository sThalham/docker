#!/bin/bash

sudo nvidia-docker build --no-cache -t detectronmod_gpu0 .
#thispid=$(sudo -E NV_GPU=0 nvidia-docker run --name=detectronmod_gpu0 -t -d -v ~/data/tless_primesense:/detectron/detectron/datasets/data/coco -p 5000:80 detectronmod_gpu0)
thispid=$(sudo -E NV_GPU=0 nvidia-docker run --name=detectronmod_gpu0 -t -d -v ~/data/tless_simplex:/detectron/detectron/datasets/data/coco -v ~/data/tless_primesense/coco_val2014:/detectron/detectron/datasets/data/coco/coco_val2014 -v ~/data/tless_primesense/annotations/instances_val2014.json:/detectron/detectron/datasets/data/coco/annotations/instances_val2014.json -p 5000:80 detectronmod_gpu0)
sudo nvidia-docker exec -it $thispid /bin/bash
sudo nvidia-docker container kill $thispid
sudo nvidia-docker container rm $thispid
