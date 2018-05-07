defmodule Rumbl.BeneTest do
  use Rumbl.ModelCase

  alias Rumbl.Bene

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Bene.changeset(%Bene{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Bene.changeset(%Bene{}, @invalid_attrs)
    refute changeset.valid?
  end
end
