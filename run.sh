#!/bin/bash

BUILD2_IMG=cmr-opendap-slate

echo "Running docs build Docker container ..."
docker run --rm -v `pwd`/build:/root/build $BUILD2_IMG bundle exec middleman server --watcher-force-polling
