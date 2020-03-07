defmodule Bingo.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :text, :string, null: false
      add :user_id, references(:users, type: :uuid), null: false
      add :room_id, references(:rooms, type: :uuid), null: false

      timestamps()
    end
  end
end
