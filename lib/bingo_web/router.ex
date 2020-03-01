defmodule BingoWeb.Router do
  use BingoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BingoWeb do
    pipe_through :api
  end
end
