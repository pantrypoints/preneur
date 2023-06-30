defmodule Preneur.Repo do
  use Ecto.Repo,
    otp_app: :preneur,
    adapter: Ecto.Adapters.Postgres
end
