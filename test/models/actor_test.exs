defmodule Rumbl.ActorTest do
  use Rumbl.ModelCase

  alias Rumbl.Actor

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Actor.changeset(%Actor{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Actor.changeset(%Actor{}, @invalid_attrs)
    refute changeset.valid?
  end
end
