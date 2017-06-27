FROM debian:9
MAINTAINER CreepCat <Centra1C0re@hotmail.com>

RUN cd / && apt-get update -qq && \
      apt-get install -y wget bzip2 && apt-get clean && \
      cd /root/

RUN wget https://downloads.getmonero.org/cli/monero-linux-x64-v0.10.3.1.tar.bz2 && \
      tar -xvf monero-linux-x64-v0.10.3.1.tar.bz2 && mv monero-v0.10.3.1 monero-wallet && \
      rm monero-linux-x64-v0.10.3.1.tar.bz2

RUN cd monero-wallet && ln -s monero-wallet-cli wallet

WORKDIR /root/monero-wallet

ENTRYPOINT ["/root/monero-wallet/monerod"]
