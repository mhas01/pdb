docker network create --attachable puppetpoc
docker build . -t puppetservervm

docker run --name puppet --hostname puppet -p 8140:8140 puppet/puppetserver
