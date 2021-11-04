#delete orphaned and dangling volumes
docker volume rm $(docker volume ls -qf dangling=true)
#delete dangling and untagged images
docker rmi $(docker images -q -f dangling=true)

