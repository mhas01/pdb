docker build . -t puppetdb
docker run -d --hostname puppetdb --network puppetpoc --name puppetdb -p 23:22 -p 8081:8081 -p 8080:8080 -it puppetdb bash