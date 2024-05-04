defmodule Critiki.Repo do
  use Ecto.Repo,
    otp_app: :critiki,
    adapter: Ecto.Adapters.Postgres
end
