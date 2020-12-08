# Automated CMake builds on various distros

![Main pipeline](https://github.com/TheAssassin/prebuilt-cmake/workflows/Main%20pipeline/badge.svg)
![ARM pipeline](https://github.com/TheAssassin/prebuilt-cmake/workflows/ARM%20pipeline/badge.svg)

This project generates builds of CMake on various distros for various architectures. It allows for using an up-to-date CMake in various distros.


## Disclaimer

The builds provided by this script are not provided officially by the CMake project. They are built automatically by GitHub actions.


## Usage

The released archives contain an "install tree". The directory layout is as follows:

```
cmake-v[version]-[dist]-[arch]/
├── bin
│   ├── cmake
│   ├── cpack
│   └── ctest
├── doc
│   [...]
└── share
    [...]

# "graphics" courtesy of tree
```

The easiest way to use these binaries is to extract them into `/usr/local`:

```sh
wget .../cmake-v[version]-[dist]-[arch].tar.gz -O- | tar -xz -C /usr/local --strip-components=1
```
