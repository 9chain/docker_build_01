FROM node:8.11
MAINTAINER Ye Jinshou <329365307@qq.com>
RUN mkdir -p /opt/workspace/
ADD nbcapid /opt/workspace/nbcapid
ADD sdksrvd /opt/workspace/sdksrvd
ADD docker-entrypoint.sh /
WORKDIR /opt/workspace/
ENTRYPOINT /docker-entrypoint.sh
