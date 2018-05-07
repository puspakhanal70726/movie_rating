defmodule Rumbl.Sylvester do
  use Rumbl.Web, :model

  schema "sylvester" do
    belongs_to :user, Rumbl.User, foreign_key: :user_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
