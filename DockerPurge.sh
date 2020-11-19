docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi --force $(docker images -aq)
docker  volume rm $(docker volume ls)