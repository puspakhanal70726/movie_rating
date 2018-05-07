defmodule Rumbl.BeneControllerTest do
  use Rumbl.ConnCase

  alias Rumbl.Bene
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, bene_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing bene"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, bene_path(conn, :new)
    assert html_response(conn, 200) =~ "New bene"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, bene_path(conn, :create), bene: @valid_attrs
    bene = Repo.get_by!(Bene, @valid_attrs)
    assert redirected_to(conn) == bene_path(conn, :show, bene.id)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, bene_path(conn, :create), bene: @invalid_attrs
    assert html_response(conn, 200) =~ "New bene"
  end

  test "shows chosen resource", %{conn: conn} do
    bene = Repo.insert! %Bene{}
    conn = get conn, bene_path(conn, :show, bene)
    assert html_response(conn, 200) =~ "Show bene"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, bene_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    bene = Repo.insert! %Bene{}
    conn = get conn, bene_path(conn, :edit, bene)
    assert html_response(conn, 200) =~ "Edit bene"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    bene = Repo.insert! %Bene{}
    conn = put conn, bene_path(conn, :update, bene), bene: @valid_attrs
    assert redirected_to(conn) == bene_path(conn, :show, bene)
    assert Repo.get_by(Bene, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    bene = Repo.insert! %Bene{}
    conn = put conn, bene_path(conn, :update, bene), bene: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit bene"
  end

  test "deletes chosen resource", %{conn: conn} do
    bene = Repo.insert! %Bene{}
    conn = delete conn, bene_path(conn, :delete, bene)
    assert redirected_to(conn) == bene_path(conn, :index)
    refute Repo.get(Bene, bene.id)
  end
end
