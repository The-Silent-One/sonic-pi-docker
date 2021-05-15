FROM x11docker/xfce

#fixes for timezone data
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Africa/Tunisia
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y build-essential cmake git libssl-dev ruby-dev erlang-base erlang-dev erlang-tools sc3-plugins-server alsa-utils libaubio5  jackd2 libjack-jackd2-dev libjack-jackd2-0 libasound2-dev librtmidi-dev pulseaudio-module-jack qt5-default qttools5-dev-tools libqt5concurrent5 libqt5core5a libqt5gui5 libqt5network5 libqt5opengl5 libqt5printsupport5 libqt5concurrent5 libqt5svg5 libqt5widgets5 libqt5svg5-dev compton pulseaudio-module-jack supercollider supercollider-server


RUN git clone https://github.com/sonic-pi-net/sonic-pi
WORKDIR /sonic-pi/app
RUN ./linux-prebuild.sh
RUN ./linux-config.sh
WORKDIR /sonic-pi/app/build
RUN cmake --build . --config Release

#if your os is suse or centos based, when you install docker it is missing /usr/bin/docker-init file.
#one of solutions is to install tinit from github inside docker image and route ENTRYPOINT through it

RUN git clone https://github.com/krallin/tini/ /tinit
ENTRYPOINT ["/tini", "--"]

#no longer need
#ENTRYPOINT [ "/bin/bash", "-l", "-c" ]

#this command runs sonic-pi only, the downfall is the screen resolution, is better to start the whole environment
#CMD ./gui/qt/sonic-pi

CMD ["startxfce4"]
