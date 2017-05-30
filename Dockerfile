FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y curl

RUN sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | tee /etc/apt/sources.list.d/msprod.list

RUN apt-get update
RUN apt-get install -y mssql-tools unixodbc-dev dotnet-dev-1.0.4

RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
