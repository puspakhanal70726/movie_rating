defmodule Rumbl.SylvesterController do
  use Rumbl.Web, :controller

  alias Rumbl.Sylvester

  def index(conn, _params) do
    sylvester = Repo.all(Sylvester)
    render(conn, "index.html", sylvester: sylvester)
  end

  def new(conn, _params) do
    changeset = Sylvester.changeset(%Sylvester{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"sylvester" => sylvester_params}) do
    changeset = Sylvester.changeset(%Sylvester{}, sylvester_params)

    case Repo.insert(changeset) do
      {:ok, sylvester} ->
        conn
        |> put_flash(:info, "Sylvester created successfully.")
        |> redirect(to: sylvester_path(conn, :show, sylvester))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    sylvester = Repo.get!(Sylvester, id)
    render(conn, "show.html", sylvester: sylvester)
  end

  def edit(conn, %{"id" => id}) do
    sylvester = Repo.get!(Sylvester, id)
    changeset = Sylvester.changeset(sylvester)
    render(conn, "edit.html", sylvester: sylvester, changeset: changeset)
  end

  def update(conn, %{"id" => id, "sylvester" => sylvester_params}) do
    sylvester = Repo.get!(Sylvester, id)
    changeset = Sylvester.changeset(sylvester, sylvester_params)

    case Repo.update(changeset) do
      {:ok, sylvester} ->
        conn
        |> put_flash(:info, "Sylvester updated successfully.")
        |> redirect(to: sylvester_path(conn, :show, sylvester))
      {:error, changeset} ->
        render(conn, "edit.html", sylvester: sylvester, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    sylvester = Repo.get!(Sylvester, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(sylvester)

    conn
    |> put_flash(:info, "Sylvester deleted successfully.")
    |> redirect(to: sylvester_path(conn, :index))
  end
end
