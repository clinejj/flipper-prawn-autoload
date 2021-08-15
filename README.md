# flipper-prawn-autoload

Sample repo for debugging the issue at https://github.com/jnunemaker/flipper/issues/532 (autoloading deprecation warning between Flipper/Prawn when included in the same application)

## Repro Steps

Use the setup instructions below to get the app up and running. You can reproduce the issue with all 3 of the following gems installed:

- flipper/flipper-active_record (https://github.com/jnunemaker/flipper)
- prawn-rails (https://github.com/cortiz/prawn-rails)
- minitest-spec-rails (https://github.com/metaskills/minitest-spec-rails)

If you remove/comment out any one of the gems, you will not see the issue. You will need to disable spring and bootsnap (already excluded from this repo).

To see the logs, run `bin/rails test` and you will see the following deprecation warning:

```sh
DEPRECATION WARNING: Initialization autoloaded the constants ApplicationHelper and ArticlesHelper.

Being able to do this is deprecated. Autoloading during initialization is going
to be an error condition in future versions of Rails.

Reloading does not reboot the application, and therefore code executed during
initialization does not run again. So, if you reload ApplicationHelper, for example,
the expected changes won't be reflected in that stale Module object.

These autoloaded constants have been unloaded.

In order to autoload safely at boot time, please wrap your code in a reloader
callback this way:

    Rails.application.reloader.to_prepare do
      # Autoload classes and modules needed at boot time here.
    end

That block runs when the application boots, and every time there is a reload.
For historical reasons, it may run twice, so it has to be idempotent.

Check the "Autoloading and Reloading Constants" guide to learn more about how
Rails autoloads and reloads.
 (called from <top (required)> at /demo-app/config/environment.rb:5)
 ```

## Host Setup Instructions

I haven't tested this due to Mac M1 issues and certain gems, but theoretically if you have ruby/sqlite/node/yarn installed you should be able to:

```sh
bundle install && yarn install
```

and start your server as normal.

## Docker Setup Instructions

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
