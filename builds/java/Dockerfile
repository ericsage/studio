FROM ericsage/studio

# Installs Oracle JDK 8u141 and Maven 3.5.0

WORKDIR /bin

# Install the Oracle JDK
RUN \
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
http://download.oracle.com/otn-pub/java/jdk/8u141-b14/jdk-8u141-linux-x64.rpm && \
rpm -ivh jdk-8u141-linux-x64.rpm && \
rm -rf jdk-8u141-linux-x64.rpm

# Install Maven
RUN \
wget http://mirror.cc.columbia.edu/pub/software/apache/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.zip && \
unzip apache-maven-3.5.0-bin.zip && \
mv apache-maven-3.5.0 /opt/maven && \
ln -s /opt/maven/bin/mvn /usr/bin/mvn && \
rm -rf apache-maven-3.5.0-bin.zip

# Restore the starting directory for the studio
WORKDIR /root/Code/src/github.com/ericsage

CMD ["/bin/bash"]


