use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :particles_api, ParticlesApiWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :particles_api, ParticlesApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "particles_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
