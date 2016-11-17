
FROM ericsage/os

RUN curl -L https://cache.ruby-lang.org/pub/ruby/stable-snapshot.tar.gz > ruby.tar.gz
RUN tar -xzf ruby.tar.gz
WORKDIR stable-snapshot
RUN ./configure
RUN make && make install
RUN mv ruby /usr/bin

WORKDIR /root
RUN rm -rf stable-snapshot ruby.tar.gz
