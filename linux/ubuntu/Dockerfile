FROM ubuntu:latest
EXPOSE 22
EXPOSE 80
RUN apt-get update -y 
RUN apt-get install -y curl
RUN curl -O https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
RUN dpkg -i puppetlabs-release-pc1-xenial.deb
RUN apt-get update
RUN apt-get install -y apt-utils openssh-server puppet-agent
RUN apt-get update
