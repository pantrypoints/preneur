defmodule Preneur.ItemsTest do
  use Preneur.DataCase

  alias Preneur.Items

  describe "products" do
    alias Preneur.Items.Product

    import Preneur.ItemsFixtures

    @invalid_attrs %{desc: nil, name: nil, photo: nil, price: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Items.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Items.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{desc: "some desc", name: "some name", photo: "some photo", price: "some price"}

      assert {:ok, %Product{} = product} = Items.create_product(valid_attrs)
      assert product.desc == "some desc"
      assert product.name == "some name"
      assert product.photo == "some photo"
      assert product.price == "some price"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Items.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{desc: "some updated desc", name: "some updated name", photo: "some updated photo", price: "some updated price"}

      assert {:ok, %Product{} = product} = Items.update_product(product, update_attrs)
      assert product.desc == "some updated desc"
      assert product.name == "some updated name"
      assert product.photo == "some updated photo"
      assert product.price == "some updated price"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Items.update_product(product, @invalid_attrs)
      assert product == Items.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Items.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Items.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Items.change_product(product)
    end
  end
end
