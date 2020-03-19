FROM ruby:2.6.5-stretch

COPY Gemfile* svc/
COPY main.rb svc/
COPY lib/ svc/lib

WORKDIR /svc

RUN bundle install

ENTRYPOINT ["ruby", "main.rb"]
