FROM golang:latest
MAINTAINER Ye Jinshou <329365307@qq.com>
RUN mkdir -p /opt/workspace/
ADD target/nbcapid /opt/workspace/nbcapid/
ADD target/cfg/ /data/nbcapid/cfg/
ADD docker-entrypoint.sh start_nbcapid.sh /opt/
WORKDIR /opt/workspace/
CMD ["/opt/docker-entrypoint.sh"]
