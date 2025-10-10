# FROM mahenp5/alpine-node:latest

# RUN apk --update add --no-cache --allow-untrusted --repository http://dl-cdn.alpinelinux.org/alpine/v3.15/main git

ARG NODE_VERSION=16
FROM mahenp5/alpine-node:${NODE_VERSION}-alpine

RUN apk --update add --no-cache --allow-untrusted --repository http://dl-cdn.alpinelinux.org/alpine/v3.15/main git

ENV TZ=America/New_York