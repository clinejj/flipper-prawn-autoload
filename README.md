# flipper-prawn-autoload

Sample repo for debugging the issue at https://github.com/jnunemaker/flipper/issues/532 (autoloading deprecation warning between Flipper/Prawn when included in the same application)

## Host Instructions

I haven't tested this due to Mac M1 issues and certain gems, but theoretically if you have ruby/sqlite/node/yarn installed you should be able to:

```sh
bundle install && yarn install
```

and start your server as normal.

## Docker Instructions

Run `docker-compose build` to build the containers, then following commands:

`docker-compose up -d web` will start the web container as a daemon

`docker-compose up tests` will start the test container and run the tests (specifically the script `./scripts/run_tests.sh`)

To run a task in container that is not running (this will create a new container):

```sh
docker-compose run --rm <container name> <command>

# example
docker-compose run --rm tests sh
```

If the container is already running (eg in the background):

```sh
docker-compose exec <container name> <command>

# example
docker-compose exec tests sh
```
