defmodule Rumbl.Repo.Migrations.CreateSylvester do
  use Ecto.Migration

  def change do
    create table(:sylvester) do
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:sylvester, [:user_id])
  end
end
