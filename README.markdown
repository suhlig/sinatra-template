# SGH PDF Render Service

This is a template for a web service using Sinatra, Puma and Postgres.

# Getting Started

Clone this repo and run `grep -riE 'sinatra[-|_]?template' .` in order to find all occurrences of `SinatraTemplate`, `sinatra-template` and `sinatra_template`. Rename them at your leisure.

# Development

Using docker-machine:

```bash
$ eval "$(docker-machine env default)"
$ docker-compose up
$ curl http://$(docker-machine ip default)
```

If you have [tmuxinator](https://github.com/tmuxinator/tmuxinator) installed (`gem install tmuxinator`), a simple call to `tmuxinator` will launch the service locally as well as the docker images using `docker-compose`. Have a look at the `.tmuxinator.yml` file to see what will be launched.
