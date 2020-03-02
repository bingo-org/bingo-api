defmodule BingoWeb.SessionView do
  use BingoWeb, :view
  alias BingoWeb.{SessionView, UserView}

  def render("index.json", %{sessions: sessions}) do
    %{data: render_many(sessions, SessionView, "session.json")}
  end

  def render("show.json", %{session: session}) do
    %{data: render_one(session, SessionView, "session.json")}
  end

  def render("session.json", %{session: session}) do
    %{token: session.token, user: render_one(session.user, UserView, "user.json")}
  end
end
