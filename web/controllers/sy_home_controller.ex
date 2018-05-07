defmodule Rumbl.SyHomeController do
  use Rumbl.Web, :controller

  alias Rumbl.SyHome

  def index(conn, _params) do
    home = Repo.all(SyHome)
    render(conn, "index.html", home: home)
  end

  def new(conn, _params) do
    changeset = SyHome.changeset(%SyHome{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"sy_home" => sy_home_params}) do
    changeset = SyHome.changeset(%SyHome{}, sy_home_params)

    case Repo.insert(changeset) do
      {:ok, sy_home} ->
        conn
        |> put_flash(:info, "Sy home created successfully.")
        |> redirect(to: sy_home_path(conn, :show, sy_home))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    sy_home = Repo.get!(SyHome, id)
    render(conn, "show.html", sy_home: sy_home)
  end

  def edit(conn, %{"id" => id}) do
    sy_home = Repo.get!(SyHome, id)
    changeset = SyHome.changeset(sy_home)
    render(conn, "edit.html", sy_home: sy_home, changeset: changeset)
  end

  def update(conn, %{"id" => id, "sy_home" => sy_home_params}) do
    sy_home = Repo.get!(SyHome, id)
    changeset = SyHome.changeset(sy_home, sy_home_params)

    case Repo.update(changeset) do
      {:ok, sy_home} ->
        conn
        |> put_flash(:info, "Sy home updated successfully.")
        |> redirect(to: sy_home_path(conn, :show, sy_home))
      {:error, changeset} ->
        render(conn, "edit.html", sy_home: sy_home, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    sy_home = Repo.get!(SyHome, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(sy_home)

    conn
    |> put_flash(:info, "Sy home deleted successfully.")
    |> redirect(to: sy_home_path(conn, :index))
  end
end
