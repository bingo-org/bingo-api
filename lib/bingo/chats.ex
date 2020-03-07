defmodule Bingo.Chats do
  import Ecto.Query, warn: false
  alias Bingo.Repo
  alias Bingo.Chats.{Room, Message}

  def create_room(attrs \\ %{}) do
    %Room{}
    |> Room.changeset(attrs)
    |> Repo.insert()
  end

  def create_message(attrs \\ %{}) do
    %Message{}
    |> Message.changeset(attrs)
    |> Repo.insert()
  end
end
