FROM ubuntu AS builder
RUN apt update
RUN apt upgrade -y
RUN apt install sudo debootstrap -y
RUN sudo debootstrap focal focal

FROM scratch
COPY --from=0 focal .

entrypoint ["/bin/bash"]