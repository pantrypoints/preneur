defmodule PreneurWeb.Api.ProductController do
  use PreneurWeb, :controller

  alias Preneur.{
    Products
  }



  def create(conn, %{"product" => product_params}) do
    case Products.create_product(product_params) do
      {:ok, product} ->
        conn
        |> put_status(:created)
        # |> fetch_flash(:info, "You can't change your own admin status")
        # |> redirect(to: "/")
        # |> redirect(to: Routes.post_index_path(PreneurWeb.Endpoint, :index))        
        # |> render("created.json")
        # |> render("thanks.html")        

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> render("error.json")
    end
  end
end
