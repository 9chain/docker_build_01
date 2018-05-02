FROM node:8.11
MAINTAINER Ye Jinshou <329365307@qq.com>
RUN mkdir -p /opt/workspace/
ADD target /opt/workspace/sdksrvd
ADD docker-entrypoint.sh start_sdksrvd.sh /opt/
WORKDIR /opt/workspace/
CMD ["/opt/docker-entrypoint.sh"]
