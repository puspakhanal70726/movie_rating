defmodule Rumbl.ToDanielController do
  use Rumbl.Web, :controller

  alias Rumbl.ToDaniel

  def index(conn, _params) do
    daniel = Repo.all(ToDaniel)
    render(conn, "index.html", daniel: daniel)
  end

  def new(conn, _params) do
    changeset = ToDaniel.changeset(%ToDaniel{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"to_daniel" => to_daniel_params}) do
    changeset = ToDaniel.changeset(%ToDaniel{}, to_daniel_params)

    case Repo.insert(changeset) do
      {:ok, to_daniel} ->
        conn
        |> put_flash(:info, "To daniel created successfully.")
        |> redirect(to: to_daniel_path(conn, :show, to_daniel))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    to_daniel = Repo.get!(ToDaniel, id)
    render(conn, "show.html", to_daniel: to_daniel)
  end

  def edit(conn, %{"id" => id}) do
    to_daniel = Repo.get!(ToDaniel, id)
    changeset = ToDaniel.changeset(to_daniel)
    render(conn, "edit.html", to_daniel: to_daniel, changeset: changeset)
  end

  def update(conn, %{"id" => id, "to_daniel" => to_daniel_params}) do
    to_daniel = Repo.get!(ToDaniel, id)
    changeset = ToDaniel.changeset(to_daniel, to_daniel_params)

    case Repo.update(changeset) do
      {:ok, to_daniel} ->
        conn
        |> put_flash(:info, "To daniel updated successfully.")
        |> redirect(to: to_daniel_path(conn, :show, to_daniel))
      {:error, changeset} ->
        render(conn, "edit.html", to_daniel: to_daniel, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    to_daniel = Repo.get!(ToDaniel, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(to_daniel)

    conn
    |> put_flash(:info, "To daniel deleted successfully.")
    |> redirect(to: to_daniel_path(conn, :index))
  end
end
