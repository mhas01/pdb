docker build -t puppetserver-standalone .
docker run --name puppet --hostname puppet --network puppetpoc -p 8140:8140 -v E:/code:/etc/puppetlabs/code -it puppetserver-standalone 
