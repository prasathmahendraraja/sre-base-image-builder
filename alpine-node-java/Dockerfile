ARG NODE_VERSION

FROM prasathmahendraraja/alpine-node:${NODE_VERSION}

RUN sed -i 's/providers = provider_sect/providers = provider_sect\n\
    ssl_conf = ssl_sect\n\
    \n\
    [ssl_sect]\n\
    system_default = system_default_sect\n\
    \n\
    [system_default_sect]\n\
    Options = UnsafeLegacyRenegotiation/' /etc/ssl/openssl.cnf

#? Just setting the repository to http does not do enough to stop the calls from being redirected through https, this enabled us to bypass any https calls
RUN sed -ie "s/https/http/g" /etc/apk/repositories

RUN apk add openjdk8 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH $PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin