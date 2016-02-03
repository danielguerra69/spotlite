FROM ubuntu:14.04
MAINTAINER Daniel Guerra
RUN dpkg --add-architecture i386
RUN apt-get -yy update
RUN apt-get -y install --no-install-recommends wget libx11-6 libx11-xcb1 libfontconfig1 supervisor xvfb x11vnc software-properties-common openbox xterm unzip
RUN add-apt-repository ppa:wine/wine-builds
RUN apt-get -yy update
RUN apt-get -y install winehq-devel
RUN apt-get -y install git-core
WORKDIR /home/spotlite
RUN wget http://www.spot-net.nl.vfcdn.net/downloads/spotlite/Spotlite\(v2\)-PORTABLE.zip
RUN unzip Spotlite\(v2\)-PORTABLE.zip
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN addgroup spotlite
RUN useradd -m -g spotlite spotlite
WORKDIR /home/spotlite
RUN git clone --recursive https://github.com/kanaka/noVNC.git
RUN chown -R spotlite:spotlite noVNC
EXPOSE 5900 6080
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD menu.xml /etc/xdg/openbox/menu.xml
ADD spotlite /usr/bin/spotlite
RUN chown spotlite:spotlite /usr/bin/spotlite*
RUN chown -R spotlite:spotlite /home/spotlite
ENV WINEPREFIX /home/spotlite/.wine
ENV WINEARCH win32
ENV DISPLAY :1
ADD start /bin/start
CMD ["/bin/start"]
