# Beamdex

This is an Erlang web application using the [Nitrogen Web
Framework](https://nitrogenproject.com).

<img width="905" alt="image" src="https://github.com/davecaos/beamdex/assets/6124495/8e47aefd-438c-46d5-a911-5eef5e3bf486">

# Building

You can rebuild the project by typing:

   make

If this fails, it likely means that its a slim release and Erlang is not
installed on this machine. Please [install
Erlang](https://www.erlang-solutions.com/resources/download.html).

# Running

You can start the application with command:

  make run_dev

# Config

The rebar.config file controls dependencies and build parameters using the
popular [rebar](http://github.com/rebar/rebar) tool.

The `plugins.config` file controls how Nitrogen plugins are handled.

The files in the `etc` directory control application configuration, including
ports, webserver set up, and the like.  Please see the files there for
configuration options, or view the Nitrogen documentation.

# Code

Dependency libraries (once being built) end up in the `lib` directory.

Source code can be found in `site/src`

Template code is in `site/templates`

Compiled Erlang modules (ebin files) go in `site/ebin`

# Live code reloading

By default Nitrogen comes with an application called [sync](http://github.com/rustyio/sync) which provides automatic code reloading when the related .erl file or .ebin file is updated.  To use this, run the following on the Erlang shell:

  sync:go().
