FROM ruby:2.3.1
MAINTAINER mingqian.ye@gmail.com

RUN echo "Image name: votable"

RUN apt-get update
RUN apt-get install -y nodejs less vim

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN gem install bundler
#RUN bundle config mirror.https://rubygems.org https://gems.ruby-china.org
RUN bundle install --without development test

ADD . /app
WORKDIR /app

ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_ENV production

EXPOSE 8080
VOLUME ["/app/log"]
CMD ["sh", "-c", "bundle exec rake assets:precompile && bundle exec puma -p 8080"]
