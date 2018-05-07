defmodule Rumbl.Repo.Migrations.CreateTom do
  use Ecto.Migration

  def change do
    create table(:tom) do
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:tom, [:user_id])
  end
end
