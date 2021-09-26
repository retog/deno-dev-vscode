FROM denoland/deno:1.14.1
RUN apt update
RUN yes | apt install git netcat iputils-ping iproute2
RUN mkdir /home/deno && chown deno /home/deno
USER deno
ENV SHELL="/bin/bash"
ENV DENO_DIR=/home/deno/.cache/deno