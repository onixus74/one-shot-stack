defmodule TestStack01.Repo do
  use Ecto.Repo,
    otp_app: :test_stack_01,
    adapter: Ecto.Adapters.Postgres
end
