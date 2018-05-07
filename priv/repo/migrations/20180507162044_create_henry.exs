defmodule Rumbl.Repo.Migrations.CreateHenry do
  use Ecto.Migration

  def change do
    create table(:henry) do
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:henry, [:user_id])
  end
end
