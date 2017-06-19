FROM ericsage/os

#Install the rustup and the latest rust stable build using rustup
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

#Install the nightly rust build and use it to install rust fmt
RUN /root/.cargo/bin/rustup install nightly && \
    /root/.cargo/bin/rustup run nightly cargo install rustfmt-nightly

#Add .cargo/bin to PATH so binaries built with cargo can be run anywhere
ENV PATH=$PATH:/root/.cargo/bin
