FROM ruby:alpine

 RUN apk add --no-cache                         \
       build-base                               \
       postgresql-dev                           \
   && rm -rf /var/cache/apk/*                   \
   && rm -rf /usr/local/lib/ruby/gems/*/cache/* \
   && rm -rf ~/.gem

RUN mkdir /app
ADD . /app
WORKDIR /app
RUN gem install bundler --no-rdoc
RUN bundle config --global silence_root_warning 1
RUN bundle install --jobs 4 --without=development test

ENV PORT 9292
EXPOSE 9292

CMD ["puma", "-e", "production"]
