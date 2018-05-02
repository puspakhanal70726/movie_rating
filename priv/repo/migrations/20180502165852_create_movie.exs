defmodule Rumbl.Repo.Migrations.CreateMovie do
  use Ecto.Migration

  def change do
    create table(:movie) do
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:movie, [:user_id])
  end
end
