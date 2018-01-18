FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y curl

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -

RUN apt-get install -y nodejs python3 python3-pip libffi-dev openssh-server

RUN rm -f /usr/bin/python &&\
    ln -s /usr/bin/python3 /usr/bin/python

RUN apt-get install -y libffi-dev libssl-dev wget jq

RUN pip3 install -U pip

RUN pip3 install azure-cli==2.0.7 && \
    pip3 install awscli==1.11.107 && \
    npm install --no-optional -g azure-cli@0.10.14
 
# WHY: Non LTS ubuntu loses support too soon, Go on LTS is too old
ENV GO_VERSION="1.9"
ENV GOROOT="/go"
ENV PATH=${PATH}:${GOROOT}/bin

RUN cd /tmp && \
    wget https://storage.googleapis.com/golang/go$GO_VERSION.linux-amd64.tar.gz && \
    tar -xvf go$GO_VERSION.linux-amd64.tar.gz && \
    mkdir -p $GOROOT && \
    mv ./go/* $GOROOT

ENV NASH_VERSION=v0.6
ENV NASHPATH=/root/nash
ENV NASHROOT=/root/nashroot
ENV PATH=${PATH}:${NASHROOT}/bin
RUN curl https://raw.githubusercontent.com/NeowayLabs/nash/master/hack/install/linux.sh | bash -s ${NASH_VERSION}
