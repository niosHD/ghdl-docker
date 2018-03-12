FROM ubuntu:16.04

LABEL maintainer Mario Werner <mario.werner@iaik.tugraz.at>

# copy the build script into the root of the container
COPY build-ghdl-with-gcc.sh /

# install dependencies and build ghdl
RUN apt-get update && \
    apt-get install -y build-essential \
                       gnat \
                       python3 \
                       texinfo \
                       wget \
                       zlib1g-dev && \
    PREFIX=/opt/ghdl /build-ghdl-with-gcc.sh

# copy the call wrapper into the container and setup symlinks
COPY run_in_env /opt/ghdl
RUN ln -s /opt/ghdl/run_in_env /usr/local/bin/ghdl
