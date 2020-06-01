FROM ubuntu AS builder
RUN apt update
RUN apt upgrade -y
RUN apt install curl debootstrap -y
RUN debootstrap focal focal http://archive.ubuntu.com/ubuntu/
WORKDIR focal/etc/apt
RUN rm -r sources.list
RUN curl https://gist.githubusercontent.com/Bartixxx32/760a68120013b172070ef6d6fca8857d/raw/6ad0098455a5cc97bdd414d62cd8d3f7738a680e/sources.list%2520focal >> sources.list

FROM scratch
COPY --from=0 focal .
RUN apt update
RUN apt upgrade -y

entrypoint ["/bin/bash"]