FROM ericsage/studio

# Installs the latest version of Haskell Stack

# Install Haskell Stack
RUN curl -sSL https://get.haskellstack.org/ | sh

# Add the default project configuration for Stack
ADD config.yaml /root/.stack/config.yaml

# Add the directory where stack installs binaries to PATH
ENV PATH=$PATH:/root/.local/bin
