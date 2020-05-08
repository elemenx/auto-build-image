ARG DOCKER_VERSION=19.03.8

FROM docker:19.03.8

RUN apk add bash ruby wget
RUN wget https://github.com/buildpacks/pack/releases/download/v0.9.0/pack-v0.9.0-linux.tgz && \
    tar xvf pack-v0.9.0-linux.tgz && \
    rm pack-v0.9.0-linux.tgz && \
    mv pack /usr/local/bin/pack
COPY src/ build/
CMD ["/build/build.sh"]
