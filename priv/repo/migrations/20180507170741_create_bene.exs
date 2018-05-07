defmodule Rumbl.Repo.Migrations.CreateBene do
  use Ecto.Migration

  def change do
    create table(:bene) do
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:bene, [:user_id])
  end
end
