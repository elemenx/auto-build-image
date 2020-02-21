ARG DOCKER_VERSION

FROM docker:${DOCKER_VERSION}

RUN apk add bash ruby
COPY src/ build/
CMD ["/build/build.sh"]
