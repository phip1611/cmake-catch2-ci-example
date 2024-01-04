# cmake-catch2-ci-example

This repository contains a minimal CMake-based project building a
trivial C++ library with [Catch2-based](https://github.com/catchorg/Catch2)
unit tests.

While the repository contains infrastructure for local builds to use a toolchain
provided by [Nix](https://nixos.org/explore), the CI doesn't use the toolchain
from Nix. The reason for that is that additionally to Nix-based builds or at
least Obtained-by-Nix-toolchain based builds, one should also test regular build
flows - as not everyone can or want to use Nix.

## Build

### Regular (With System's Toolchain)

Install CMake and Catch2 in version 3 globally. Then follow the steps below:

```shell
$ mkdir build && cd build
$ cmake .. -DBUILD_TESTING=On
$ make
$ make test
```

### Regular (With Toolchain From Nix)

```shell
$ nix develop # enter Nix shell
```

Follow the steps from above.

### Nix

```shell
$ nix build .
$ ls -l result/lib/libfoo.a
```
