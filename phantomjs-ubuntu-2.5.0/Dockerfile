FROM ubuntu:16.04

# Update the system and install necessary packages
RUN apt-get update && apt-get install -y \
    wget \
    bzip2 \
    ca-certificates \
    build-essential \
    chrpath \
    libssl-dev \
    libxft-dev \
    libfreetype6 \
    libfreetype6-dev \
    libfontconfig1 \
    libfontconfig1-dev \
    libjpeg-turbo8 \
    libhyphen0 \
    libxslt1.1 \
    tzdata \
    nfs-common

# Set the working directory
WORKDIR /app

# Download and extract PhantomJS
RUN wget --no-check-certificate https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.5.0-beta-linux-ubuntu-xenial-x86_64.tar.gz
RUN tar -xvzf phantomjs-2.5.0-beta-linux-ubuntu-xenial-x86_64.tar.gz
RUN rm phantomjs-2.5.0-beta-linux-ubuntu-xenial-x86_64.tar.gz
RUN chmod 777 /app/phantomjs-2.5.0-beta-ubuntu-xenial/bin/phantomjs

# Add PhantomJS to the PATH
ENV PATH /app/phantomjs-2.5.0-beta-ubuntu-xenial/bin:$PATH

# Check PhantomJS version
ENTRYPOINT ["phantomjs", "--version"]