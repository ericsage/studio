
FROM ericsage/os

RUN curl -sSL https://s3.amazonaws.com/download.fpcomplete.com/centos/7/fpco.repo | tee /etc/yum.repos.d/fpco.repo

RUN yum -y install stack

ADD config.yaml /root/.stack/config.yaml

RUN echo 'export PATH=$PATH:$HOME/.local/bin' >> /root/.bashrc
