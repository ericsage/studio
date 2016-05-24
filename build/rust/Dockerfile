
FROM ericsage/os

RUN curl -sSf https://static.rust-lang.org/rustup.sh | sed 's/sudo //g' > rustup.sh
RUN chmod +x rustup.sh
RUN rustup.sh

CMD ["/bin/bash"]
