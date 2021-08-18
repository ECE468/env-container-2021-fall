FROM debian:stable
RUN apt update && \
    apt install -y wget git gnupg software-properties-common build-essential && \
    wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | gpg --dearmor > /etc/apt/trusted.gpg.d/adpotopenjdk.gpg && \
    add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/ && \
    apt update && \
    apt install -y adoptopenjdk-8-hotspot && \
    wget https://www.antlr.org/download/antlr-4.9.2-complete.jar -O /usr/local/share/antlr.jar && \
    useradd -m user
ADD antlr /usr/local/bin/
RUN echo 'export CLASSPATH=$CLASSPATH:/usr/local/share/antlr.jar' >> /etc/profile

USER user
WORKDIR /home/user
CMD ["/bin/bash"]