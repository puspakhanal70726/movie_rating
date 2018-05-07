defmodule Rumbl.TomControllerTest do
  use Rumbl.ConnCase

  alias Rumbl.Tom
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, tom_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing tom"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, tom_path(conn, :new)
    assert html_response(conn, 200) =~ "New tom"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, tom_path(conn, :create), tom: @valid_attrs
    tom = Repo.get_by!(Tom, @valid_attrs)
    assert redirected_to(conn) == tom_path(conn, :show, tom.id)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, tom_path(conn, :create), tom: @invalid_attrs
    assert html_response(conn, 200) =~ "New tom"
  end

  test "shows chosen resource", %{conn: conn} do
    tom = Repo.insert! %Tom{}
    conn = get conn, tom_path(conn, :show, tom)
    assert html_response(conn, 200) =~ "Show tom"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, tom_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    tom = Repo.insert! %Tom{}
    conn = get conn, tom_path(conn, :edit, tom)
    assert html_response(conn, 200) =~ "Edit tom"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    tom = Repo.insert! %Tom{}
    conn = put conn, tom_path(conn, :update, tom), tom: @valid_attrs
    assert redirected_to(conn) == tom_path(conn, :show, tom)
    assert Repo.get_by(Tom, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    tom = Repo.insert! %Tom{}
    conn = put conn, tom_path(conn, :update, tom), tom: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit tom"
  end

  test "deletes chosen resource", %{conn: conn} do
    tom = Repo.insert! %Tom{}
    conn = delete conn, tom_path(conn, :delete, tom)
    assert redirected_to(conn) == tom_path(conn, :index)
    refute Repo.get(Tom, tom.id)
  end
end
