defmodule TodoPhoenixWeb.Router do
  use TodoPhoenixWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {TodoPhoenixWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TodoPhoenixWeb do
    pipe_through :browser

    get "/", PageController, :home
    resources "/items", ItemController
  end

  # Other scopes may use custom stacks.
  # scope "/api", TodoPhoenixWeb do
  #   pipe_through :api
  # end
end
