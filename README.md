# Exsom

Exsom is a thin wrapper around the [erlsom](https://github.com/willemdj/erlsom)
XML parsing library. Much of the documentation has been taken from the `erlsom`
documentation, as they are obviously equivalent.

## Changes from `erlsom`

Many functions have been renamed and/or broken into modules.
A user should only need to import the modules that they need,
and have it be very readable.

The most common functions get exposed as defaults in the parent module.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add exsom to your list of dependencies in `mix.exs`:

        def deps do
          [{:exsom, "~> 0.1.0"}]
        end

  2. Ensure exsom is started before your application:

        def application do
          [applications: [:exsom]]
        end
