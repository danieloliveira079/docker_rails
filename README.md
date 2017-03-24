# Rails Development Environment Using Docker

How to use docker for Ruby on Rails development environment. The project consists of a `docker-compose.yaml` that puts together:

* Rails 5.0
* Postgresql 9.5
* Redis 3.2
* Elasticsearch
* Memcached

## How to use

`$ git clone git@github.com:danieloliveira079/docker_rails.git && cd docker_rails`

`$ make up`

Open [http://localhost:3000](http://localhost:300)

## Connect to the rails container

From a second shell session on your local computer, runs:

`$ make exec` - opens a bash session

or

`$ make irb` - opens the irb console

## How to connect to external services

Reference from the `Rails` source code to the following environment variables in order to communicate with the services:

```
MEMCACHED_URL: memcached:11211
REDIS_URL: redis://redis:6379
POSTGRES_URL: db
```

For example:

`./config/database.yml`

```
development:
  <<: *default
  database: railsapp_development
  host: <%= ENV["POSTGRES_URL"]%>
  user: postgres
  password: postgres
```

Redis

`./config/initializers/redis.rb`

By default, the client will try to read the REDIS_URL environment variable and use that as URL to connect to. Check the documentaion [here](https://github.com/redis/redis-rb).

`$redis = Redis::Namespace.new("docker_rails", :redis => Redis.new)`


Memcached and Elasticsearch can be accessed respective by the environment variables:

* `MEMCACHED_URL`
* `ELASTICSEARCH_URL`
