defmodule Bingo.OAuth.MemoryClient do
  alias Bingo.OAuth.{Credential, User}

  def verify(%Credential{provider: :google, token: "valid"}) do
    user = %User{
      name: "Juan Jose Lopez Tugores",
      email: "tugorez@gmail.com",
      image: "www.google.com/tugorez.png"
    }

    {:ok, user}
  end

  def verify(_) do
    {:error, :invalid_credential, "Please provide a valid token."}
  end
end
