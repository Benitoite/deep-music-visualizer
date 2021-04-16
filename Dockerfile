FROM debian:stable-slim

#   Setup container configuration

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends python3 python3-pip python3-setuptools git gnupg curl lsb-release wget software-properties-common ca-certificates ssl-cert ffmpeg libsndfile1 -y
RUN bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
RUN git clone https://github.com/Benitoite/deep-music-visualizer.git ~/deep-music-visualizer
RUN cd ~/deep-music-visualizer && python3 -m pip --no-cache-dir install -r requirements.txt

#   set the entrypoint command

LABEL maintainer="kd6kxr@gmail.com"
CMD echo "This is a test..." && cd deep-music-visualizer && sh && echo "THATS ALL FOLKS!!!"
