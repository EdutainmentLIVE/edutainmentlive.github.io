FROM ruby:2.5-alpine
RUN apk add --no-cache g++ gcc git libc-dev make
WORKDIR /blag
COPY gems.rb .
RUN bundle install
COPY . .
EXPOSE 4000
CMD bundle exec jekyll serve --host 0.0.0.0 --future --watch
