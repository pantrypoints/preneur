defmodule Preneur.ItemsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Preneur.Items` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        desc: "some desc",
        name: "some name",
        photo: "some photo",
        price: "some price"
      })
      |> Preneur.Items.create_product()

    product
  end
end
