FROM denoland/deno:1.14.1
RUN apt update
RUN yes | apt install git netcat iputils-ping iproute2 procps

ARG USERNAME=deno
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupmod --gid $USER_GID $USERNAME \
    && usermod --uid $USER_UID --gid $USER_GID $USERNAME 

RUN mkdir /home/deno && chown deno /home/deno
USER deno
ENV SHELL="/bin/bash"
ENV DENO_DIR=/home/deno/.cache/deno