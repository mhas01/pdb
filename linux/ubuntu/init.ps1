docker build . -t ubuntuvm
docker run -d -p 22:22 --name ubuntuvm -it ubuntuvm

