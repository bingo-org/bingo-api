defmodule Bingo.OAuth.WebClient do
  alias Bingo.OAuth.Credential

  def verify(%Credential{provider: :google, token: token}) do
    url = "https://www.googleapis.com/oauth2/v3/userinfo?access_token=#{token}"

    with {:ok, %{status_code: 200, body: body}} <- HTTPoison.get(url),
         {:ok, user} <- Poison.decode(body) do
      user = %{
        name: user["name"],
        email: user["email"],
        image: user["picture"]
      }

      {:ok, user}
    else
      _ -> {:error, :invalid_token}
    end
  end
end
