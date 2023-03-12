defmodule Olympus.Repo do
  use Ecto.Repo,
    otp_app: :olympus,
    adapter: Ecto.Adapters.Postgres
end
