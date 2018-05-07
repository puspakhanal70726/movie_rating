defmodule Rumbl.SylvesterControllerTest do
  use Rumbl.ConnCase

  alias Rumbl.Sylvester
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, sylvester_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing sylvester"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, sylvester_path(conn, :new)
    assert html_response(conn, 200) =~ "New sylvester"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, sylvester_path(conn, :create), sylvester: @valid_attrs
    sylvester = Repo.get_by!(Sylvester, @valid_attrs)
    assert redirected_to(conn) == sylvester_path(conn, :show, sylvester.id)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, sylvester_path(conn, :create), sylvester: @invalid_attrs
    assert html_response(conn, 200) =~ "New sylvester"
  end

  test "shows chosen resource", %{conn: conn} do
    sylvester = Repo.insert! %Sylvester{}
    conn = get conn, sylvester_path(conn, :show, sylvester)
    assert html_response(conn, 200) =~ "Show sylvester"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, sylvester_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    sylvester = Repo.insert! %Sylvester{}
    conn = get conn, sylvester_path(conn, :edit, sylvester)
    assert html_response(conn, 200) =~ "Edit sylvester"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    sylvester = Repo.insert! %Sylvester{}
    conn = put conn, sylvester_path(conn, :update, sylvester), sylvester: @valid_attrs
    assert redirected_to(conn) == sylvester_path(conn, :show, sylvester)
    assert Repo.get_by(Sylvester, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    sylvester = Repo.insert! %Sylvester{}
    conn = put conn, sylvester_path(conn, :update, sylvester), sylvester: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit sylvester"
  end

  test "deletes chosen resource", %{conn: conn} do
    sylvester = Repo.insert! %Sylvester{}
    conn = delete conn, sylvester_path(conn, :delete, sylvester)
    assert redirected_to(conn) == sylvester_path(conn, :index)
    refute Repo.get(Sylvester, sylvester.id)
  end
end
