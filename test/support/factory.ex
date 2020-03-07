defmodule Bingo.Factory do
  use ExMachina.Ecto, repo: Bingo.Repo

  alias Bingo.Accounts.User
  alias Bingo.Chats.{Room, Message}

  def user_factory do
    %User{
      name: "user.name",
      image: "user.image",
      email: "user.email"
    }
  end

  def room_factory do
    %Room{
      title: "room.title"
    }
  end

  def message_factory do
    %Message{
      text: "message.text",
      user: build(:user),
      room: build(:room)
    }
  end
end
