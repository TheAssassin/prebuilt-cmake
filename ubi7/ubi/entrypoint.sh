#! /bin/bash

set -e
set -x

# workaround for "fatal: unable to look up current user in the passwd file: no such user"
mkdir /tmp/home
export HOME=/tmp/home
git config --global user.name "prebuilt-cmake"
git config --global user.email "prebuilt-cmake@example.com"

# get a compiler that allows for using modern-ish C++ (>= 11) on a distro that doesn't normally support it
# before you ask: yes, the binaries will work on CentOS 6 even without devtoolset (they somehow partially link C++
# things statically while using others from the system...)
# so, basically, it's magic!
source /opt/rh/devtoolset-*/enable

exec "$@"
