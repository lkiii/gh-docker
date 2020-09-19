FROM ubuntu

RUN apt-get update && apt-get install -y gnupg2 software-properties-common && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0 && \
    apt-add-repository https://cli.github.com/packages && \
    apt-get update && apt-get install -y gh && \
    apt-get remove -y gnupg2 software-properties-common && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists && \
    useradd -m gh
    
USER gh
WORKDIR /home/gh
ENTRYPOINT [ "gh" ]
