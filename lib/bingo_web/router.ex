defmodule BingoWeb.Router do
  use BingoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BingoWeb do
    pipe_through :api

    post "/sessions", SessionController, :create
  end
end
