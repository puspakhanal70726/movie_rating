defmodule Rumbl.HughTest do
  use Rumbl.ModelCase

  alias Rumbl.Hugh

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Hugh.changeset(%Hugh{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Hugh.changeset(%Hugh{}, @invalid_attrs)
    refute changeset.valid?
  end
end
