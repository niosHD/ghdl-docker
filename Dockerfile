FROM ubuntu:16.04

LABEL maintainer Mario Werner <mario.werner@iaik.tugraz.at>

RUN apt-get update && apt-get install -y \
  libgnat-4.9 \
  make \
  python3 \
  wget

RUN wget https://github.com/tgingold/ghdl/releases/download/v0.34/ghdl-v0.34-mcode-ubuntu.tgz -q && \
  tar xzf ghdl-v0.34-mcode-ubuntu.tgz -C /usr/local && \
  rm -rf ghdl-v0.34-mcode-ubuntu.tgz
