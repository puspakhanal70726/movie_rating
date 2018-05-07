defmodule Rumbl.HughControllerTest do
  use Rumbl.ConnCase

  alias Rumbl.Hugh
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, hugh_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing hugh"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, hugh_path(conn, :new)
    assert html_response(conn, 200) =~ "New hugh"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, hugh_path(conn, :create), hugh: @valid_attrs
    hugh = Repo.get_by!(Hugh, @valid_attrs)
    assert redirected_to(conn) == hugh_path(conn, :show, hugh.id)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, hugh_path(conn, :create), hugh: @invalid_attrs
    assert html_response(conn, 200) =~ "New hugh"
  end

  test "shows chosen resource", %{conn: conn} do
    hugh = Repo.insert! %Hugh{}
    conn = get conn, hugh_path(conn, :show, hugh)
    assert html_response(conn, 200) =~ "Show hugh"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, hugh_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    hugh = Repo.insert! %Hugh{}
    conn = get conn, hugh_path(conn, :edit, hugh)
    assert html_response(conn, 200) =~ "Edit hugh"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    hugh = Repo.insert! %Hugh{}
    conn = put conn, hugh_path(conn, :update, hugh), hugh: @valid_attrs
    assert redirected_to(conn) == hugh_path(conn, :show, hugh)
    assert Repo.get_by(Hugh, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    hugh = Repo.insert! %Hugh{}
    conn = put conn, hugh_path(conn, :update, hugh), hugh: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit hugh"
  end

  test "deletes chosen resource", %{conn: conn} do
    hugh = Repo.insert! %Hugh{}
    conn = delete conn, hugh_path(conn, :delete, hugh)
    assert redirected_to(conn) == hugh_path(conn, :index)
    refute Repo.get(Hugh, hugh.id)
  end
end
