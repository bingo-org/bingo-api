defmodule Bingo.ChatsTest do
  use Bingo.DataCase
  import Bingo.Factory
  alias Bingo.Chats
  alias Bingo.Chats.{Room, Message}

  describe "create_room/1" do
    test "creates a room with valid data" do
      valid_attrs = params_for(:room)
      assert {:ok, %Room{} = room} = Chats.create_room(valid_attrs)
    end
  end

  describe "create_message/1" do
    test "creates a message with valid data" do
      valid_attrs = params_with_assocs(:message)
      assert {:ok, %Message{} = message} = Chats.create_message(valid_attrs)
    end
  end
end
