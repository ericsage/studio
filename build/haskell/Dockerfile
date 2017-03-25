
FROM ericsage/os

RUN curl -sSL https://get.haskellstack.org/ | sh

ADD config.yaml /root/.stack/config.yaml

ENV PATH=$PATH:/root/.local/bin
