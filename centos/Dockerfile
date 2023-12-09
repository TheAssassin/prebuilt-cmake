ARG DOCKER_ARCH
ARG DIST
ARG RELEASE

FROM ${DOCKER_ARCH}/${DIST}:${RELEASE}

ARG ARCH
ARG DIST
ENV ARCH=${ARCH} DIST=${DIST}

SHELL ["/bin/bash", "-x", "-c"]

RUN yum install -y centos-release-scl-rh && \
    yum install -y devtoolset-8 wget curl patchelf vim-common fuse libfuse2 \
    libtool autoconf automake zlib-devel libjpeg-devel libpng-devel nano git \
    openssl-devel

# the shell wrapper takes care of enabling devtoolset and running a shell properly
# unfortunately this is the easiest and most solid workaround to the limitations of the scl command
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
SHELL ["/entrypoint.sh", "bash", "-x", "-c"]

CMD ["bash"]
