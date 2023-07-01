defmodule PreneurWeb.Router do
  use PreneurWeb, :router
  use Pow.Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {PreneurWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # pipeline :protected do
  #   plug Pow.Plug.RequireAuthenticated, error_handler: PreneurWeb.AuthErrorHandler
  # end

  # pipeline :not_authenticated do
  #   plug Pow.Plug.RequireNotAuthenticated, error_handler: PreneurWeb.AuthErrorHandler
  # end


  scope "/" do
    pipe_through :browser

    pow_routes()
  end

  scope "/", PreneurWeb do
    pipe_through :browser
    # pipe_through [:browser, :protected]
    get "/", PageController, :home
    resources "/products", ProductController
  end


  # scope "/", PreneurWeb do
  #   pipe_through [:browser, :not_authenticated]

  #   get "/signup", RegistrationController, :new, as: :signup
  #   post "/signup", RegistrationController, :create, as: :signup
  #   get "/login", SessionController, :new, as: :login
  #   post "/login", SessionController, :create, as: :login
  # end
  # Other scopes may use custom stacks.
  # scope "/api", PreneurWeb do
  #   pipe_through :api
  # end



  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:preneur, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: PreneurWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
