#!/usr/bin/env bash
pushd src/k8s.io/federation

build_linux()
{
    make fcp kubefed

    make test

    mkdir $PREFIX/bin
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

popd
