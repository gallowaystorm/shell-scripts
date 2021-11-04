#delete exited containers
docker rm $(docker ps -aqf status=exited)
#delete all images
docker rm $(docker ps -aqf status=exited)
#kill all running containers
docker kill $(docker ps -q)
#delete all containers
docker rm $(docker ps -aq)
#just to ensure
#Delete stopped containers, and volumes and networks that are not used by containers
docker system prune -a

