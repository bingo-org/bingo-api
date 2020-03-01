defmodule Bingo.OAuthTest do
  use Bingo.DataCase

  alias Bingo.OAuth

  describe "verify/1" do
    test "it should retrieve an user with a valid google credential" do
      valid_credential = %{"provider" => "google", "token" => "valid.google_token"}
      assert {:ok, user} = OAuth.verify(valid_credential)
      assert user.name
      assert user.email
      assert user.image
    end

    test "it should indicate that the credential is not valid" do
      invalid_credential = %{}

      assert {:error, :invalid_credential, "You should provide a 'provider' and a 'token'"} ==
               OAuth.verify(invalid_credential)
    end

    test "it should indicate that the token is not valid" do
      invalid_credential = %{"provider" => "google", "token" => "invalid.google_token"}

      assert {:error, :invalid_credential, "Please provide a valid token."} ==
               OAuth.verify(invalid_credential)
    end

    test "it should indicate that the given provider is not supported" do
      invalid_credential = %{"provider" => "facebook", "token" => "valid.facebook_token"}

      assert {:error, :invalid_credential, "The facebook provider is not supported."} ==
               OAuth.verify(invalid_credential)
    end
  end
end
