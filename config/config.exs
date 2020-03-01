# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :bingo,
  ecto_repos: [Bingo.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :bingo, BingoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "sMyW0pg/xmWmz9QtOiUB0akkRHpbXUcsIYHZmdQYmZxGwXGay1B5igsSrjRBeiiD",
  render_errors: [view: BingoWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Bingo.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "baaNC+LS"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
