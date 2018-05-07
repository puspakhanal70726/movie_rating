defmodule Rumbl.Repo.Migrations.CreateToDaniel do
  use Ecto.Migration

  def change do
    create table(:daniel) do
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:daniel, [:user_id])
  end
end
