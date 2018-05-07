defmodule Rumbl.ToDanielControllerTest do
  use Rumbl.ConnCase

  alias Rumbl.ToDaniel
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, to_daniel_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing daniel"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, to_daniel_path(conn, :new)
    assert html_response(conn, 200) =~ "New to daniel"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, to_daniel_path(conn, :create), to_daniel: @valid_attrs
    to_daniel = Repo.get_by!(ToDaniel, @valid_attrs)
    assert redirected_to(conn) == to_daniel_path(conn, :show, to_daniel.id)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, to_daniel_path(conn, :create), to_daniel: @invalid_attrs
    assert html_response(conn, 200) =~ "New to daniel"
  end

  test "shows chosen resource", %{conn: conn} do
    to_daniel = Repo.insert! %ToDaniel{}
    conn = get conn, to_daniel_path(conn, :show, to_daniel)
    assert html_response(conn, 200) =~ "Show to daniel"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, to_daniel_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    to_daniel = Repo.insert! %ToDaniel{}
    conn = get conn, to_daniel_path(conn, :edit, to_daniel)
    assert html_response(conn, 200) =~ "Edit to daniel"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    to_daniel = Repo.insert! %ToDaniel{}
    conn = put conn, to_daniel_path(conn, :update, to_daniel), to_daniel: @valid_attrs
    assert redirected_to(conn) == to_daniel_path(conn, :show, to_daniel)
    assert Repo.get_by(ToDaniel, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    to_daniel = Repo.insert! %ToDaniel{}
    conn = put conn, to_daniel_path(conn, :update, to_daniel), to_daniel: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit to daniel"
  end

  test "deletes chosen resource", %{conn: conn} do
    to_daniel = Repo.insert! %ToDaniel{}
    conn = delete conn, to_daniel_path(conn, :delete, to_daniel)
    assert redirected_to(conn) == to_daniel_path(conn, :index)
    refute Repo.get(ToDaniel, to_daniel.id)
  end
end
