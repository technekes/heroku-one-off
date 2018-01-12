FROM ruby:2.4-alpine

RUN \
  apk --no-cache add --virtual build-dependencie \
    build-base \
    libffi-dev && \
  apk --no-cache add --virtual release-dependencie \
    git \
    openssh

WORKDIR /usr/src/app

COPY Gemfile .
COPY heroku-one-off.gemspec .
COPY lib/heroku-one-off/version.rb ./lib/heroku-one-off/version.rb

RUN \
  gem update --system && \
  gem install bundler && \
  bundle install -j 4

COPY . /usr/src/app
