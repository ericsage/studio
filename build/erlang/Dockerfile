
FROM ericsage/os

RUN curl http://packages.erlang-solutions.com/site/esl/esl-erlang/FLAVOUR_1_general/esl-erlang_19.1.5~centos~7_amd64.rpm > erlang.rpm
RUN yum install -y erlang.rpm
RUN rm erlang.rpm
