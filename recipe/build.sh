#!/usr/bin/env bash

build_linux()
{
    make fcp kubefed

    make test

    mv _output/bin/{fcp,kubefed} $PREFIX/bin

    pushd $PREFIX/bin
    ./fcp --make-symlinks
    popd
}

case $(uname -s) in
    "Linux")
        build_linux
        ;;
esac
