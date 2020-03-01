defmodule Bingo.OAuth do
  alias Bingo.OAuth.{Credential, User}

  @client Application.get_env(:bingo, :o_auth_client, Bingo.OAuth.WebClient)

  def verify(attrs) do
    with {:ok, %Credential{} = credential} <- Credential.new(attrs),
         {:ok, %User{} = user} <- @client.verify(credential) do
      {:ok, user}
    else
      error -> error
    end
  end
end
