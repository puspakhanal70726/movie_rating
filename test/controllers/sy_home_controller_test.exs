defmodule Rumbl.SyHomeControllerTest do
  use Rumbl.ConnCase

  alias Rumbl.SyHome
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, sy_home_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing home"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, sy_home_path(conn, :new)
    assert html_response(conn, 200) =~ "New sy home"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, sy_home_path(conn, :create), sy_home: @valid_attrs
    sy_home = Repo.get_by!(SyHome, @valid_attrs)
    assert redirected_to(conn) == sy_home_path(conn, :show, sy_home.id)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, sy_home_path(conn, :create), sy_home: @invalid_attrs
    assert html_response(conn, 200) =~ "New sy home"
  end

  test "shows chosen resource", %{conn: conn} do
    sy_home = Repo.insert! %SyHome{}
    conn = get conn, sy_home_path(conn, :show, sy_home)
    assert html_response(conn, 200) =~ "Show sy home"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, sy_home_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    sy_home = Repo.insert! %SyHome{}
    conn = get conn, sy_home_path(conn, :edit, sy_home)
    assert html_response(conn, 200) =~ "Edit sy home"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    sy_home = Repo.insert! %SyHome{}
    conn = put conn, sy_home_path(conn, :update, sy_home), sy_home: @valid_attrs
    assert redirected_to(conn) == sy_home_path(conn, :show, sy_home)
    assert Repo.get_by(SyHome, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    sy_home = Repo.insert! %SyHome{}
    conn = put conn, sy_home_path(conn, :update, sy_home), sy_home: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit sy home"
  end

  test "deletes chosen resource", %{conn: conn} do
    sy_home = Repo.insert! %SyHome{}
    conn = delete conn, sy_home_path(conn, :delete, sy_home)
    assert redirected_to(conn) == sy_home_path(conn, :index)
    refute Repo.get(SyHome, sy_home.id)
  end
end
