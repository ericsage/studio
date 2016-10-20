
FROM ericsage/os

WORKDIR /bin
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jdk-8u111-linux-x64.rpm
RUN rpm -ivh jdk-8u111-linux-x64.rpm

RUN wget http://mirror.cc.columbia.edu/pub/software/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.zip
RUN unzip apache-maven-3.3.9-bin.zip
RUN mv apache-maven-3.3.9 /opt/maven
RUN ln -s /opt/maven/bin/mvn /usr/bin/mvn

RUN rm -rf jdk-8u111-linux-x64.rpm apache-maven-3.3.9-bin.zip

WORKDIR /root

CMD ["/bin/bash"]


