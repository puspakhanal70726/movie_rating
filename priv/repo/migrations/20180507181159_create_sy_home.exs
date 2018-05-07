defmodule Rumbl.Repo.Migrations.CreateSyHome do
  use Ecto.Migration

  def change do
    create table(:home) do
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:home, [:user_id])
  end
end
