
FROM ericsage/os

RUN curl https://packages.erlang-solutions.com/erlang/esl-erlang/FLAVOUR_1_general/esl-erlang_18.2-1~centos~7_amd64.rpm > erlang.rpm
RUN yum install -y erlang.rpm
RUN rm erlang.rpm

CMD ["/bin/bash"]
