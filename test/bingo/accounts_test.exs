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

    test "retrieves the user if the user with the given email exists" do
      valid_attrs = %{
        name: "Juan Jose Lopez Tugores",
        email: "tugorez@gmail.com",
        image: "www.google.com/tugorez.png"
      }

      assert {:ok, %User{} = user1} = Accounts.create_user(valid_attrs)
      assert {:ok, %User{} = user2} = Accounts.create_user(valid_attrs)
      assert user1 == user2
    end
  end
end
