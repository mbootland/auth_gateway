FROM ruby:3.1.2-alpine

RUN apk add --update --virtual \
postgresql-client \
postgresql-dev \
git \
&& RM -rf /var/cache/apk/*

WORKDIR /app
COPY . /app/

ENV BUNDLE_PATH /gems
RUN bundle install

ENTRYPOINT ["bin/rails"]
CMD ["s", "-b", "0.0.0.0"]

EXPOSE 3000