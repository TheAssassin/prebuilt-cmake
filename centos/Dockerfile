ARG DOCKER_ARCH
ARG DIST
ARG RELEASE

FROM ${DOCKER_ARCH}/${DIST}:${RELEASE}

ARG ARCH
ARG DIST
ARG RELEASE
ENV ARCH=${ARCH} DIST=${DIST} RELEASE=${RELEASE}

SHELL ["/bin/bash", "-x", "-c"]

# during Docker build, yum doesn't detect it's an i386 environment on x86_64 machines, and tries to install x86_64 packages, whic>
# this little command fixes this
RUN if [ "$ARCH" == "i386" ]; then \
        sed -i 's/$basearch/i386/g' /etc/yum.repos.d/CentOS-Base.repo; \
    fi

RUN yum install -y wget curl patchelf vim-common fuse libfuse2 \
    libtool autoconf automake zlib-devel libjpeg-devel libpng-devel nano git \
    openssl-devel

RUN if [ "$ARCH" == "x86_64" ]; then \
        yum install -y centos-release-scl-rh && \
        yum install -y devtoolset-8; \
    fi

# thanks CloudLinux, you're really helping us poor AppImage creators seeking for maximum compatibility by providing devtoolset i386 builds
RUN if [ "$ARCH" == "i386" ]; then \
        yum install -y yum-utils && \
        rpm --import https://repo.cloudlinux.com/cloudlinux/security/RPM-GPG-KEY-CloudLinux && \
        yum-config-manager --add-repo https://www.repo.cloudlinux.com/cloudlinux/7/sclo/devtoolset-8/i386/ && \
        yum install -y devtoolset-8 wget curl patchelf vim-common fuse libfuse2 libtool autoconf automake zlib-devel libjpeg-devel libpng-devel nano git openssl-devel; \
    fi


# the shell wrapper takes care of enabling devtoolset and running a shell properly
# unfortunately this is the easiest and most solid workaround to the limitations of the scl command
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
SHELL ["/entrypoint.sh", "bash", "-x", "-c"]

CMD ["bash"]
