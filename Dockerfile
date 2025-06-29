FROM ubuntu:latest

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install V2Ray
RUN wget https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip \
    && unzip v2ray-linux-64.zip -d /usr/local/v2ray \
    && rm v2ray-linux-64.zip

# Create configuration directory
RUN mkdir -p /etc/v2ray

# Copy configuration file (replace with your actual config)
COPY config.json /etc/v2ray/config.json

# Expose the necessary port
EXPOSE 8080

# Start V2Ray
CMD ["/usr/local/v2ray/v2ray", "-config", "/etc/v2ray/config.json"]
