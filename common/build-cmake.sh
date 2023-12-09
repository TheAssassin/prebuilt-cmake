#! /bin/bash

if [[ "$ARCH" == "" ]] || [[ "$DIST" == "" ]]; then
    echo "Usage: env ARCH=... DIST=... bash $0"
    exit 2
fi

set -x
set -e

if [ "$DOCKER" == "" ] && [ -d /dev/shm ]; then
    export TEMP_BASE=/dev/shm
else
    export TEMP_BASE=/tmp
fi

BUILD_DIR="$(mktemp -d "$TEMP_BASE"/cmake-build-XXXXXX)"

cleanup () {
    if [ -d "$BUILD_DIR" ]; then
        rm -rf "$BUILD_DIR"
    fi
}

trap cleanup EXIT

REPO_ROOT="$(readlink -f "$(dirname "${BASH_SOURCE[0]}")"/..)"
OLD_CWD="$(readlink -f .)"

cd "$BUILD_DIR"

git clone "https://github.com/Kitware/CMake.git"

cd CMake

# check out latest tag
git checkout "$(git rev-list --tags --max-count=1)"

label=cmake-$(git describe --tags)-"$DIST"-"$RELEASE"-"$ARCH"
./configure --no-system-libs --prefix=/"$label" --no-qt-gui --parallel="$(nproc)"

make -j"$(nproc)"
make install DESTDIR=.

tar cfvz "$label".tar.gz "$label"
mv "$label".tar.gz "$OLD_CWD"
