defmodule Rumbl.Repo.Migrations.CreateRequest do
  use Ecto.Migration

  def change do
    create table(:request) do
      add :" moviename", :string
      add :actor, :string
      add :rating, :integer
      add :comment, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:request, [:user_id])
  end
end
