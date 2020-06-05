# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :pokemon,
  ecto_repos: [Pokemon.Repo]

# Configures the endpoint
config :pokemon, PokemonWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7ILZtOGB6ZIXWIsQDSUPSNFHNsxiXIHwzVfCO1DdH9nY1ewDL+lp4uaH3WBR6TeL",
  render_errors: [view: PokemonWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Pokemon.PubSub,
  live_view: [signing_salt: "kO+qxUbE"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
