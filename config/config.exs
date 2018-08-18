# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :particles_api,
  ecto_repos: [ParticlesApi.Repo]

# Configures the endpoint
config :particles_api, ParticlesApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pFAzrmMl4kbvrit+V07ODUIeBa7PVvlVGJeXMWcZKdX/ED5LSrNe25jWaOPHYaRc",
  render_errors: [view: ParticlesApiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ParticlesApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
