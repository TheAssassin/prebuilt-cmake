ARG DOCKER_ARCH
ARG DIST
ARG RELEASE

FROM ${DOCKER_ARCH}/${DIST}:${RELEASE}

ARG ARCH
ARG DIST
ARG RELEASE
ENV ARCH=${ARCH} DIST=${DIST} RELEASE=${RELEASE}

SHELL ["/bin/bash", "-x", "-c"]

RUN apt-get update && \
    apt-get install -y build-essential wget curl patchelf vim-common fuse \
        libfuse2 libtool autoconf automake zlib1g-dev libjpeg-dev libpng-dev \
        nano git libssl-dev

CMD ["bash"]
