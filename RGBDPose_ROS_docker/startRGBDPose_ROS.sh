#!/bin/bash

sudo docker build --no-cache -t rgbdpose_ros .
thispid=$(sudo docker run --network=host --name=rgbdpose_ros -t -d rgbdpose_ros)

#sudo nvidia-docker exec -it $thispid bash

#sudo nvidia-docker container kill $thispid
#sudo nvidia-docker container rm $thispid


