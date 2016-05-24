
FROM ericsage/os

RUN curl -sSf https://static.rust-lang.org/rustup.sh | sed 's/sudo //g' > /tmp/rustup.sh
RUN chmod +x /tmp/rustup.sh
RUN /tmp/rustup.sh
RUN rm /tmp/rustup.sh

CMD ["/bin/bash"]
