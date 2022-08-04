FROM ubuntu:20.04

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -qy update
RUN apt install -qy python3 \
                python3-pip \
                software-properties-common \
                git \
                ansible
RUN pip install --upgrade pip wheel && \
    pip install --upgrade cryptography cffi && \
    pip install ansible && \
    pip install ansible-lint==4.0.0 && \
    pip install --upgrade --user ansible

CMD ["/bin/bash"]

