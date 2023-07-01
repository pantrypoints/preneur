defmodule Preneur.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :desc, :string
      add :price, :string
      add :photo, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:products, [:user_id])
  end
end
