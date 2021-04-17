FROM debian:unstable-slim

#   Setup container configuration

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends build-essential gfortran cmake libllvm-12-ocaml-dev libllvm12 llvm-12 llvm-12-dev llvm-12-doc llvm-12-examples llvm-12-runtime python3 python3-pip python3-setuptools git gnupg curl lsb-release wget software-properties-common ca-certificates ssl-cert ffmpeg libsndfile1 -y
RUN git clone https://github.com/Reference-LAPACK/lapack.git ~/lapack && cd ~/lapack && mkdir build && cd build && cmake .. && make && make install
RUN git clone https://github.com/Benitoite/deep-music-visualizer.git ~/deep-music-visualizer && cd ~/deep-music-visualizer && python3 -m pip --no-cache-dir install -r requirements.txt

#   set the entrypoint command

LABEL maintainer="kd6kxr@gmail.com"
CMD echo "This is a test..." && cd deep-music-visualizer && sh && echo "THATS ALL FOLKS!!!"
