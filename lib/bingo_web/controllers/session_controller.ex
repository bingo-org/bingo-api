defmodule BingoWeb.SessionController do
  use BingoWeb, :controller

  alias Bingo.Accounts
  alias Bingo.OAuth

  action_fallback BingoWeb.FallbackController

  def create(conn, %{"credential" => credential}) do
    with {:ok, user} <- OAuth.verify(credential),
         {:ok, user} <- Accounts.create_user(Map.from_struct(user)) do
      token = Phoenix.Token.sign(conn, "user", user.id)
      session = %{token: token, user: user}

      conn
      |> put_status(:created)
      |> render("show.json", session: session)
    end
  end
end
