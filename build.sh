#!/bin/bash
AVX=ON
AVX2=ON
SSE41=ON
SSE42=ON
CUDA=OFF
OPENCL=OFF
OPENCL_SVM=OFF
OPENGL=ON
VERSION=3.3.0
GTK=OFF
QT=OFF

ROOT=$HOME

apt-get update && \
apt-get install -y \
        build-essential \
        cmake \
        git \
        wget \
        unzip \
        yasm \
        pkg-config \
        libswscale-dev \
        libeigen3-dev \
        libtbb2 \
        libtbb-dev \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        libjasper-dev \
        libavformat-dev \
        libpq-dev \
        libboost-all-dev

wget -c https://github.com/opencv/opencv/archive/$VERSION.tar.gz
tar xvzf $VERSION.tar.gz -C $ROOT 

mkdir -p $ROOT/opencv-$VERSION/cmake_binary \
    && ls \
    && (cd $ROOT/opencv-$VERSION/cmake_binary \
    && cmake \
    -DBUILD_TIFF=ON \
    -DBUILD_opencv_java=OFF \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DWITH_CUDA=$CUDA \
    -DENABLE_AVX=$AVX \
    -DENABLE_AVX2=$AVX2 \
    -DENABLE_SSE41=$SSE41 \
    -DENABLE_SSE42=$SSE42 \
    -DENABLE_SSSE3=ON \
    -DWITH_OPENGL=$OPENGL \
    -DWITH_GTK=$GTK \
    -DWITH_QT=$QT \
    -DWITH_OPENCL=$OPENCL \
    -DWITH_OPENCL_SVM=$OPENCL_SVM \
    -DWITH_JPEG=ON \
    -DWITH_WEBP=ON \
    -DWITH_PNG=ON \
    -DWITH_IPP=ON \
    -DWITH_TBB=$TBB \
    -DWITH_EIGEN=ON \
    -DWITH_V4L=ON \
    -DWITH_FFMPEG=ON \
    -DENABLE_PRECOMPILED_HEADERS=ON \
    -DBUILD_PERF_TESTS=OFF \
    -DBUILD_TESTS=OFF \
    -DINSTALL_C_EXAMPLES=OFF \
    ..  && make install)

# rm -rf $VERSION.tar.gz $ROOT/opencv-$VERSION
