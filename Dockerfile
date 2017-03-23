FROM ruby:2.3

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
     build-essential nodejs libpq-dev postgresql-client \
     && rm -rf /var/lib/apt/lists/*

ENV LANG C.UTF-8
ENV SRC_PATH /usr/src/app

RUN mkdir -p SRC_PATH

WORKDIR $SRC_PATH

EXPOSE 3000

CMD ["./entrypoint.sh"]
