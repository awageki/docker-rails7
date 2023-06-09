FROM ruby:3.2.0
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    vim
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN gem update --system && gem install bundler \
    && bundle config set force_ruby_platform true \
    && bundle install
ADD . /myapp