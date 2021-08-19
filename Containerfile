FROM debian:stable
RUN apt update && \
    apt install -y wget git gnupg software-properties-common build-essential python3-sh && \
    wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | gpg --dearmor > /etc/apt/trusted.gpg.d/adpotopenjdk.gpg && \
    add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/ && \
    apt update && \
    apt install -y adoptopenjdk-8-hotspot && \
    wget https://www.antlr.org/download/antlr-4.9.2-complete.jar -O /usr/local/share/antlr.jar && \
    useradd -m user
ADD antlr /usr/local/bin/
ENV CLASSPATH=/usr/local/share/antlr.jar

USER user
WORKDIR /home/user
RUN git clone https://github.com/milindkulkarni/RiscSim
CMD ["/bin/bash"]