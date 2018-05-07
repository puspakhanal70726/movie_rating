defmodule Rumbl.ToDanielTest do
  use Rumbl.ModelCase

  alias Rumbl.ToDaniel

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ToDaniel.changeset(%ToDaniel{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ToDaniel.changeset(%ToDaniel{}, @invalid_attrs)
    refute changeset.valid?
  end
end
