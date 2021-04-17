FROM python:3.7-buster

#   Setup container configuration

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends build-essential gfortran cmake git gnupg curl lsb-release wget software-properties-common ca-certificates ssl-cert ffmpeg libsndfile1 -y
RUN wget https://apt.llvm.org/llvm.sh && chmod +x llvm.sh && sudo ./llvm.sh 10
RUN git clone https://github.com/Reference-LAPACK/lapack.git ~/lapack && cd ~/lapack && mkdir build && cd build && cmake .. && make && make install
RUN git clone https://github.com/Benitoite/deep-music-visualizer.git ~/deep-music-visualizer && cd ~/deep-music-visualizer && python3 -m pip --no-cache-dir install -r requirements.txt

#   set the entrypoint command

LABEL maintainer="kd6kxr@gmail.com"
CMD echo "This is a test..." && cd deep-music-visualizer && sh && echo "THATS ALL FOLKS!!!"
