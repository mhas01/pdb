docker build . -t ubuntuvm
docker run -it ubuntuvm -d -p 22:22 -p 81:80 --name ubuntuvm