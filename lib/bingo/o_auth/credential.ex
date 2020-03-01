defmodule Bingo.OAuth.Credential do
  defstruct provider: nil, token: nil

  alias Bingo.OAuth.Credential

  def new(%{"provider" => "google", "token" => token}) do
    {:ok, %Credential{provider: :google, token: token}}
  end

  def new(%{"provider" => provider}) do
    {:error, :invalid_credential, "The #{provider} provider is not supported."}
  end

  def new(_) do
    {:error, :invalid_credential, "You should provide a 'provider' and a 'token'"}
  end
end
