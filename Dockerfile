FROM ubuntu:latest
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates curl unzip
RUN curl -L -o /tmp/v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip && \
   unzip /tmp/v2ray.zip -d /opt/v2ray && \
   rm /tmp/v2ray.zip
COPY config.json /etc/v2ray/config.json
EXPOSE 8080 # Or your configured port
CMD ["/opt/v2ray/v2ray", "-config", "/etc/v2ray/config.json"]
