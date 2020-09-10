FROM ruby:2.5.1

RUN apt-get update -qq && \
  apt-get install -y build-essential \
  nodejs vim

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get install -y nodejs

RUN mkdir /webapp
WORKDIR /webapp

ADD Gemfile /webapp/Gemfile
ADD Gemfile.lock /webapp/Gemfile.lock

RUN bundle install

ADD . /webapp

RUN mkdir -p tmp/sockets