FROM debian:9
MAINTAINER CreepCat <Centra1C0re@hotmail.com>

RUN cd / && apt-get update -qq && \
      apt-get install -y wget bzip2 && apt-get clean

RUN wget https://downloads.getmonero.org/cli/monero-linux-x64-v0.10.3.1.tar.bz2 && \
      tar -xvf monero-linux-x64-v0.10.3.1.tar.bz2 && rm monero-linux-x64-v0.10.3.1.tar.bz2

RUN cd monero-v0.10.3.1 && ln -s monero-wallet-cli wallet

COPY start.sh /

WORKDIR /monero-v0.10.3.1

ENTRYPOINT ["./start"]
