defmodule Rumbl.SyHomeTest do
  use Rumbl.ModelCase

  alias Rumbl.SyHome

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = SyHome.changeset(%SyHome{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = SyHome.changeset(%SyHome{}, @invalid_attrs)
    refute changeset.valid?
  end
end
