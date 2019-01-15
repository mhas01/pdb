docker build . -t ubuntuvm
docker run -d --network puppetpoc --name ubuntuvm -p 22:22 -p 81:80 -it ubuntuvm  bash