defmodule Rumbl.HenryTest do
  use Rumbl.ModelCase

  alias Rumbl.Henry

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Henry.changeset(%Henry{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Henry.changeset(%Henry{}, @invalid_attrs)
    refute changeset.valid?
  end
end
