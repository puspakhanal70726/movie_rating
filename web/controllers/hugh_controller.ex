defmodule Rumbl.HughController do
  use Rumbl.Web, :controller

  alias Rumbl.Hugh

  def index(conn, _params) do
    hugh = Repo.all(Hugh)
    render(conn, "index.html", hugh: hugh)
  end

  def new(conn, _params) do
    changeset = Hugh.changeset(%Hugh{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"hugh" => hugh_params}) do
    changeset = Hugh.changeset(%Hugh{}, hugh_params)

    case Repo.insert(changeset) do
      {:ok, hugh} ->
        conn
        |> put_flash(:info, "Hugh created successfully.")
        |> redirect(to: hugh_path(conn, :show, hugh))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    hugh = Repo.get!(Hugh, id)
    render(conn, "show.html", hugh: hugh)
  end

  def edit(conn, %{"id" => id}) do
    hugh = Repo.get!(Hugh, id)
    changeset = Hugh.changeset(hugh)
    render(conn, "edit.html", hugh: hugh, changeset: changeset)
  end

  def update(conn, %{"id" => id, "hugh" => hugh_params}) do
    hugh = Repo.get!(Hugh, id)
    changeset = Hugh.changeset(hugh, hugh_params)

    case Repo.update(changeset) do
      {:ok, hugh} ->
        conn
        |> put_flash(:info, "Hugh updated successfully.")
        |> redirect(to: hugh_path(conn, :show, hugh))
      {:error, changeset} ->
        render(conn, "edit.html", hugh: hugh, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    hugh = Repo.get!(Hugh, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(hugh)

    conn
    |> put_flash(:info, "Hugh deleted successfully.")
    |> redirect(to: hugh_path(conn, :index))
  end
end
