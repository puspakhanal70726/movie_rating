defmodule Rumbl.Repo.Migrations.CreateActor do
  use Ecto.Migration

  def change do
    create table(:actor) do
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:actor, [:user_id])
  end
end
