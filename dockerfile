FROM ruby:3.1.2-bullseye

WORKDIR /app
COPY Gemfile Gemfile.lock package.json yarn.lock ./

RUN apt update
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs
RUN corepack enable
RUN gem install rails -v 6.1
RUN gem install bundler
RUN bundle install
RUN rails webpacker:install
RUN rails db:migrate
RUN rails db:seed
