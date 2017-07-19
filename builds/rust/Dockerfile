FROM ericsage/studio

# Installs the latest version of Rust using rustup

# Install rustup and the latest rust stable build using rustup
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

# Install the nightly rust build and use it to install rust fmt
RUN /root/.cargo/bin/rustup install nightly && \
    /root/.cargo/bin/rustup run nightly cargo install rustfmt-nightly

# Add the directory where cargo install binaries to PATH
ENV PATH=$PATH:/root/.cargo/bin
