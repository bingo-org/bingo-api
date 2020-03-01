defmodule Bingo.Accounts do
  import Ecto.Query, warn: false
  alias Bingo.Repo
  alias Bingo.Accounts.User

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end
end
