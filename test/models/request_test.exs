defmodule Rumbl.RequestTest do
  use Rumbl.ModelCase

  alias Rumbl.Request

  @valid_attrs %{" moviename": "some  moviename", actor: "some actor", comment: "some comment", rating: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Request.changeset(%Request{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Request.changeset(%Request{}, @invalid_attrs)
    refute changeset.valid?
  end
end
