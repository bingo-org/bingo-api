defmodule Bingo.Accounts do
  import Ecto.Query, warn: false
  alias Bingo.Repo
  alias Bingo.Accounts.User

  def create_user(attrs \\ %{}) do
    email = Map.get(attrs, :email) || Map.get(attrs, "email")
    user_found = Repo.get_by(User, email: email)

    if user_found do
      {:ok, user_found}
    else
      %User{}
      |> User.changeset(attrs)
      |> Repo.insert()
    end
  end
end
