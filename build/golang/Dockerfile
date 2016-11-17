
FROM ericsage/os

RUN curl -L https://storage.googleapis.com/golang/go1.7.3.linux-amd64.tar.gz > go.tar.gz
RUN tar -C /usr/bin -xzf go.tar.gz
RUN rm go.tar.gz

RUN echo "export PATH=$PATH:/usr/bin/go/bin" >> /root/.bashrc
RUN echo "export GOROOT=/usr/bin/go" >> /root/.bashrc
RUN echo "export GOPATH=$HOME/Code" >> /root/.bashrc




