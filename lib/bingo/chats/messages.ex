defmodule Bingo.Chats.Message do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "messages" do
    field :text, :string
    belongs_to :user, Bingo.Accounts.User
    belongs_to :room, Bingo.Chats.Room

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:text, :user_id, :room_id])
    |> validate_required([:text, :user_id, :room_id])
  end
end
