defmodule Preneur.Items.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :desc, :string
    field :name, :string
    field :photo, :string
    field :price, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :desc, :price, :photo])
#    |> validate_required([:name, :desc, :price, :photo])
  end
end
