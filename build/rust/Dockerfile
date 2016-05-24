
FROM ericsage/os

RUN yum install -y sudo

RUN curl -sSf https://static.rust-lang.org/rustup.sh | sh

RUN yum remove sudo

CMD ["/bin/bash"]
