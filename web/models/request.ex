defmodule Rumbl.Request do
  use Rumbl.Web, :model

  schema "request" do
    field :" moviename", :string
    field :actor, :string
    field :rating, :integer
    field :comment, :string
    belongs_to :user, Rumbl.User, foreign_key: :user_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:" moviename", :actor, :rating, :comment])
    |> validate_required([:" moviename", :actor, :rating, :comment])
  end
end
