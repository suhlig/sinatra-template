# Sinatra Template App

This is a template for a web service using Sinatra, Puma and Postgres.

# Getting Started

Clone this repo and run `grep -riE 'sinatra[-|_]?template' .` in order to find all occurrences of `SinatraTemplate`, `sinatra-template` and `sinatra_template`. Rename them at your leisure.

# Development

## Run locally

```bash
$ export DB=postgres://db-user:db-password@$(docker-machine ip default):5432/sinatra-template-db
$ bundle exec rake db:migrate
$ bundle exec rackup
$ curl http://localhost:9292
```

## Run in docker-machine

```bash
$ eval "$(docker-machine env default)"
$ docker-compose up
$ curl http://$(docker-machine ip default)
```

If you have [tmuxinator](https://github.com/tmuxinator/tmuxinator) installed (`gem install tmuxinator`), a simple call to `tmuxinator` will launch the service locally as well as the docker images using `docker-compose`. Have a look at the `.tmuxinator.yml` file to see what will be launched.

# Deployment

```bash
$ bundle exec rake db:migrate
```

# Troubleshooting

## Use the `sequel` database monitor

```bash
$ bundle exec sequel $DB
```

# TODO

* Run DB migrations on container startup
