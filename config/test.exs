use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :test_stack_01, TestStack01Web.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :test_stack_01, TestStack01.Repo,
  username: "postgres",
  password: "postgres",
  database: "test_stack_01_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
