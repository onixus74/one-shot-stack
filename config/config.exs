# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :test_stack_01,
  ecto_repos: [TestStack01.Repo]

# Configures the endpoint
config :test_stack_01, TestStack01Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NYF8MISCzafyfKKc1MB2z2V7h4iPAXnqrMlIwf0OTKXvL7jhI/lxkEEmh9Spiqdm",
  render_errors: [view: TestStack01Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TestStack01.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
