ARG NODE_VERSION

FROM node:${NODE_VERSION}-alpine

RUN apk update \
    && apk add --no-cache tzdata curl

ENV TZ=America/New_York