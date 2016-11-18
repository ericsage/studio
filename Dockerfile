#Developent

FROM centos
MAINTAINER Eric Sage <eric.david.sage@gmail.com>

#Clean root
RUN rm /root/*

#Add repositories
ADD form/docker /etc/yum.repos.d/docker.repo
RUN rpm -iUvh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

#Install software
RUN yum update -y
RUN yum groupinstall -y 'Development Tools'
RUN yum groupinstall -y 'Console Internet Tools'
RUN yum install -y tmux vim python-pip python-setuptools python-wheel ctags git man-pages man docker-engine tree wget
RUN curl -L https://github.com/docker/machine/releases/download/v0.8.2/docker-machine-`uname -s`-`uname -m` > /usr/bin/docker-machine && chmod +x /usr/bin/docker-machine

RUN pip install --upgrade pip
RUN pip install virtualenv
RUN pip install awscli docker-compose

#Add config files
ADD config/vim /root/.vimrc
ADD config/bash /root/.bashrc
ADD config/git /root/.gitconfig

#Add SDKS
WORKDIR /root/Code
ADD form/google-cloud /root/Code/google-cloud.txt
RUN curl https://dl.google.com/dl/cloudsdk/channels/rapid/google-cloud-sdk.tar.gz > gcsdk.tar.gz
RUN tar xvzf gcsdk.tar.gz
RUN /root/Code/google-cloud-sdk/install.sh < /root/Code/google-cloud.txt
RUN rm gcsdk.tar.gz google-cloud.txt
RUN echo "Y" | /root/Code/google-cloud-sdk/bin/gcloud components install kubectl

#Configure vim
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
RUN echo "Enter" | vim +PluginInstall || true
RUN echo "Enter" | vim +GoInstallBinaries || true

WORKDIR /root

CMD ["/bin/bash"]
