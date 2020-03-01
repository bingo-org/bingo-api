defmodule Bingo.OAuth.User do
  @enforce_keys [:name, :email, :image]
  defstruct name: nil, email: nil, image: nil
end
