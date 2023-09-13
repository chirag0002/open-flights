FROM ruby:2.7

WORKDIR /app

RUN apt-get update && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  postgresql-client

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

COPY . /app
WORKDIR /app

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
