FROM wernight/phantomjs

USER root
RUN apt update \
    && apt install -y nfs-common

ENTRYPOINT ["phantomjs", "--version"]