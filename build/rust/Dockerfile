
FROM ericsage/os

MOVE sudo /root/Code/bin/sudo
RUN chmod +x /root/Code/bin/sudo

RUN curl -sSf https://static.rust-lang.org/rustup.sh | sh

RUN rm /root/Code/bin/sudo

CMD ["/bin/bash"]
