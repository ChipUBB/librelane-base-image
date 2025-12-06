FROM ubuntu:24.04
RUN apt-get update && apt-get install -y python3 python3-pip curl systemd git
ADD install-nix.sh /tmp/install-nix.sh
RUN /tmp/install-nix.sh

RUN useradd -ms /bin/bash designer \
    && usermod -aG sudo designer

# Clone LibreLane repository
RUN git clone https://github.com/librelane/librelane.git /opt/librelane

RUN pip install "cocotb~=2.0"  --break-system-packages

ENTRYPOINT ["/bin/bash", "-l"]