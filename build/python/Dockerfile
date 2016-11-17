
FROM ericsage/os

RUN wget http://www.python.org/ftp/python/3.5.2/Python-3.5.2.tar.xz && tar xf Python-3.5.2.tar.xz
WORKDIR Python-3.5.2
RUN ./configure
RUN make && make install

WORKDIR /root
RUN rm -rf Python-*


