#Developent

FROM centos
MAINTAINER Eric Sage <eric.david.sage@gmail.com>

#Clean root
RUN rm /root/*

#Set locale
localectl set-locale LANG=en_US.UTF-8

#Add repositories
ADD form/docker /etc/yum.repos.d/docker.repo
RUN rpm -iUvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm

#Install software
RUN yum update -y
RUN yum groupinstall -y 'Development Tools'
RUN yum groupinstall -y 'Console Internet Tools'
RUN yum install -y tmux vim python-pip ctags git man-pages man docker-engine tree
RUN curl -L https://github.com/docker/machine/releases/download/v0.6.0/docker-machine-`uname -s`-`uname -m` > /usr/bin/docker-machine && chmod +x /usr/bin/docker-machine
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

#Configure vim
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
RUN echo "Enter" | vim +PluginInstall || true

WORKDIR /root

CMD ["/bin/bash"]
