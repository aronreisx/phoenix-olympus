# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :olympus,
  ecto_repos: [Olympus.Repo]

# Configures the endpoint
config :olympus, OlympusWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1KUton12m3voaAJyob6TlhzVmxeqXNVr6Oa6tb7AosXUsSeJNrLBe55P3Df23AiV",
  render_errors: [view: OlympusWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Olympus.PubSub,
  live_view: [signing_salt: "gQzx6bBr"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
