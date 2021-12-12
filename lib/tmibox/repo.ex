defmodule Tmibox.Repo do
  use Ecto.Repo,
    otp_app: :tmibox,
    adapter: Ecto.Adapters.Postgres
end
