defmodule Rumbl.SylvesterTest do
  use Rumbl.ModelCase

  alias Rumbl.Sylvester

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Sylvester.changeset(%Sylvester{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Sylvester.changeset(%Sylvester{}, @invalid_attrs)
    refute changeset.valid?
  end
end
