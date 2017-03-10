
FROM ericsage/os

RUN curl -L https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz > go.tar.gz
RUN tar -C /usr/bin -xzf go.tar.gz
RUN rm go.tar.gz

RUN echo 'export PATH=$PATH:/usr/bin/go/bin' >> /root/.bashrc

ENV PATH=$PATH:/usr/bin/go/bin
ENV GOROOT=/usr/bin/go
ENV GOPATH=/root/Code

RUN echo "Enter" | vim +GoInstallBinaries || true
