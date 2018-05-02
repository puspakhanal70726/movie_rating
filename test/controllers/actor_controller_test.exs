defmodule Rumbl.ActorControllerTest do
  use Rumbl.ConnCase

  alias Rumbl.Actor
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, actor_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing actor"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, actor_path(conn, :new)
    assert html_response(conn, 200) =~ "New actor"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, actor_path(conn, :create), actor: @valid_attrs
    actor = Repo.get_by!(Actor, @valid_attrs)
    assert redirected_to(conn) == actor_path(conn, :show, actor.id)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, actor_path(conn, :create), actor: @invalid_attrs
    assert html_response(conn, 200) =~ "New actor"
  end

  test "shows chosen resource", %{conn: conn} do
    actor = Repo.insert! %Actor{}
    conn = get conn, actor_path(conn, :show, actor)
    assert html_response(conn, 200) =~ "Show actor"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, actor_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    actor = Repo.insert! %Actor{}
    conn = get conn, actor_path(conn, :edit, actor)
    assert html_response(conn, 200) =~ "Edit actor"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    actor = Repo.insert! %Actor{}
    conn = put conn, actor_path(conn, :update, actor), actor: @valid_attrs
    assert redirected_to(conn) == actor_path(conn, :show, actor)
    assert Repo.get_by(Actor, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    actor = Repo.insert! %Actor{}
    conn = put conn, actor_path(conn, :update, actor), actor: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit actor"
  end

  test "deletes chosen resource", %{conn: conn} do
    actor = Repo.insert! %Actor{}
    conn = delete conn, actor_path(conn, :delete, actor)
    assert redirected_to(conn) == actor_path(conn, :index)
    refute Repo.get(Actor, actor.id)
  end
end
