FROM ruby:2.3.1
MAINTAINER CMR Dev Team <https://github.com/nasa/Common-Metadata-Repository>

RUN apt-get update && apt-get install -y nodejs \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY lib /root/lib
COPY Gemfile /root
COPY config.rb /root

WORKDIR /root
RUN bundle install
RUN cp *.rb lib
