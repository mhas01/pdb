FROM ubuntu:latest
#EXPOSE 80
#EXPOSE 22
EXPOSE 8140

RUN apt-get update -y 
RUN apt-get install -y apt-utils nginx  openssh-server curl
#RUN service nginx start

RUN curl -O https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
RUN dpkg -i puppetlabs-release-pc1-xenial.deb
RUN apt-get update
RUN apt-get install -y puppetserver
#RUN wget https://apt.puppetlabs.com/puppet-release-bionic.deb
#RUN dpkg -i puppet-release-bionic.deb
RUN apt-get update
RUN apt-get install -y puppetserver
RUN apt-get update
#RUN puppet resource package puppetmaster ensure=latest

RUN /opt/puppetlabs/puppet/bin/puppet module install puppetlabs-puppetdb --version 7.1.0
RUN service puppetserver start