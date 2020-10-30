FROM ubuntu AS builder
RUN apt update
RUN apt upgrade -y
RUN apt install curl debootstrap -y
RUN debootstrap groovy groovy http://archive.ubuntu.com/ubuntu/
WORKDIR groovy/etc/apt
RUN rm -r sources.list
RUN curl https://gist.githubusercontent.com/Bartixxx32/08f5cc3029f9b05c8b80e6e43bebb436/raw/0cd29718335f128535ee6ccb63e252d9b5b1b1e2/sources.list >> sources.list

FROM scratch
COPY --from=0 groovy .
RUN apt update
RUN apt upgrade -y

entrypoint ["/bin/bash"]
