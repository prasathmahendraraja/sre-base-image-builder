ARG NODE_VERSION

FROM prasathmahendraraja/alpine-node-java:${NODE_VERSION}

USER root

RUN apk add --update git
RUN apk add --update curl
RUN apk add --update --no-cache python3 py3-pip
RUN apk add --update --no-cache python2
RUN apk add --update docker openrc
RUN rc-update add docker boot

ENV TZ=America/New_York