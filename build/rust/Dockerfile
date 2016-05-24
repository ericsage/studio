
FROM ericsage/os

RUN curl -sSf https://static.rust-lang.org/rustup.sh 
RUN sed 's/sudo //g' rustup.sh
RUN rustup.sh

CMD ["/bin/bash"]
