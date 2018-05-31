#!/bin/bash

BUILD1_DIR=docker/base
BUILD1_IMG=cmr-slate
BUILD2_DIR=docker/docs
BUILD2_IMG=cmr-opendap-slate

echo
echo "Copying build files ..."
cp -rv Gemfile config.rb lib $BUILD1_DIR
cp -rv source $BUILD2_DIR

echo
echo "Building Docker containers ..."
docker build --tag $BUILD1_IMG $BUILD1_DIR
docker build --tag $BUILD2_IMG $BUILD2_DIR

echo
echo "Running docs build Docker container ..."
docker run --rm -v `pwd`/build:/root/build $BUILD2_IMG

echo
echo "Cleaning up build files ..."
rm -r $BUILD1_DIR/lib
rm -v $BUILD1_DIR/Gemfile $BUILD1_DIR/config.rb
rm -rv $BUILD2_DIR/source
