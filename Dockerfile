FROM fedora:26
MAINTAINER Pavel Odvody <podvody@redhat.com>

RUN dnf install -y npm git
RUN mkdir -p /opt/dotvis/data && cd /opt/dotvis && git clone https://github.com/anvaka/pm\
 && rm /opt/dotvis/pm/src/config.js
RUN cd /opt/dotvis/pm && npm i
ADD dot2pm/ /opt/dotvis/dot2pm
RUN cd /opt/dotvis/dot2pm && npm i
ADD bootstrap.sh /opt/dotvis/
ADD data/serve.py /opt/dotvis/data/serve.py
ADD config.js /opt/dotvis/pm/src/config.js

ENTRYPOINT ["/opt/dotvis/bootstrap.sh"]
