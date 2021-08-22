FROM debian:stable
RUN apt update && \
    apt install -y wget git gnupg software-properties-common build-essential python3-sh sudo default-jdk && \
    wget https://www.antlr.org/download/antlr-4.9.2-complete.jar -O /usr/local/share/antlr.jar && \
    useradd -m user && \
    chmod 660 /etc/sudoers && echo "user     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && chmod 440 /etc/sudoers
ADD antlr /usr/local/bin/
ENV CLASSPATH=/usr/local/share/antlr.jar

USER user
WORKDIR /home/user
RUN git clone https://github.com/milindkulkarni/RiscSim
CMD ["/bin/bash"]
