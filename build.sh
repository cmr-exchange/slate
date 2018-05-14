#!/bin/bash
docker-compose build
docker run --rm -v `pwd`:/usr/src/app/source -w /usr/src/app/source slate_docs bundle exec middleman build --clean

