docker network create --attachable puppetpoc
docker build . -t puppetservervm

docker run -d --network puppetpoc --name puppet --hostname puppet -p 8140:8140 -it puppetservervm
