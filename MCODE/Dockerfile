FROM ubuntu:14.04

LABEL maintainer Mario Werner <mario.werner@iaik.tugraz.at>

RUN apt-get update && apt-get install -y \
  libgnat-4.6 \
  make \
  python3 \
  wget

RUN wget https://github.com/tgingold/ghdl/releases/download/v0.35/ghdl-0.35-mcode-ubuntu14.tgz -q && \
  tar xzf ghdl-0.35-mcode-ubuntu14.tgz -C /usr/local && \
  rm -rf ghdl-0.35-mcode-ubuntu14.tgz
