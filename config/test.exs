use Mix.Config

# Configure your database
config :bingo, Bingo.Repo,
  username: "postgres",
  password: "postgres",
  database: "bingo_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :bingo, BingoWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Set memory client for tests
config :bingo, :o_auth_client, Bingo.OAuth.MemoryClient
