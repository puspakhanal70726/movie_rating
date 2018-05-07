defmodule Rumbl.Repo.Migrations.CreateHugh do
  use Ecto.Migration

  def change do
    create table(:hugh) do
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:hugh, [:user_id])
  end
end
