defmodule Rumbl.HenryControllerTest do
  use Rumbl.ConnCase

  alias Rumbl.Henry
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, henry_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing henry"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, henry_path(conn, :new)
    assert html_response(conn, 200) =~ "New henry"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, henry_path(conn, :create), henry: @valid_attrs
    henry = Repo.get_by!(Henry, @valid_attrs)
    assert redirected_to(conn) == henry_path(conn, :show, henry.id)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, henry_path(conn, :create), henry: @invalid_attrs
    assert html_response(conn, 200) =~ "New henry"
  end

  test "shows chosen resource", %{conn: conn} do
    henry = Repo.insert! %Henry{}
    conn = get conn, henry_path(conn, :show, henry)
    assert html_response(conn, 200) =~ "Show henry"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, henry_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    henry = Repo.insert! %Henry{}
    conn = get conn, henry_path(conn, :edit, henry)
    assert html_response(conn, 200) =~ "Edit henry"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    henry = Repo.insert! %Henry{}
    conn = put conn, henry_path(conn, :update, henry), henry: @valid_attrs
    assert redirected_to(conn) == henry_path(conn, :show, henry)
    assert Repo.get_by(Henry, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    henry = Repo.insert! %Henry{}
    conn = put conn, henry_path(conn, :update, henry), henry: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit henry"
  end

  test "deletes chosen resource", %{conn: conn} do
    henry = Repo.insert! %Henry{}
    conn = delete conn, henry_path(conn, :delete, henry)
    assert redirected_to(conn) == henry_path(conn, :index)
    refute Repo.get(Henry, henry.id)
  end
end
