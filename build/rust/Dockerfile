
FROM ericsage/os

RUN git clone https://github.com/rust-lang/rust.git /rust
WORKDIR /rust
RUN ./configure
RUN make && make install

RUN git clone --recursive https://github.com/rust-lang/cargo /cargo
WORKDIR /cargo
RUN ./configure
RUN make && make install

WORKDIR /root

RUN rm /rust /cargo

CMD ["/bin/bash"]

