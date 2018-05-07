defmodule Rumbl.TomTest do
  use Rumbl.ModelCase

  alias Rumbl.Tom

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Tom.changeset(%Tom{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Tom.changeset(%Tom{}, @invalid_attrs)
    refute changeset.valid?
  end
end
