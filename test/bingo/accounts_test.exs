defmodule Bingo.AccountsTest do
  use Bingo.DataCase
  alias Bingo.Accounts
  alias Bingo.Accounts.{User}

  describe "create_user/1" do
    test "creates a user with valid data" do
      valid_attrs = %{
        name: "Juan Jose Lopez Tugores",
        email: "tugorez@gmail.com",
        image: "www.google.com/tugorez.png"
      }

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.name
      assert user.email
      assert user.image
    end
  end
end
