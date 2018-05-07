defmodule Rumbl.HenryController do
  use Rumbl.Web, :controller

  alias Rumbl.Henry

  def index(conn, _params) do
    henry = Repo.all(Henry)
    render(conn, "index.html", henry: henry)
  end

  def new(conn, _params) do
    changeset = Henry.changeset(%Henry{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"henry" => henry_params}) do
    changeset = Henry.changeset(%Henry{}, henry_params)

    case Repo.insert(changeset) do
      {:ok, henry} ->
        conn
        |> put_flash(:info, "Henry created successfully.")
        |> redirect(to: henry_path(conn, :show, henry))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    henry = Repo.get!(Henry, id)
    render(conn, "show.html", henry: henry)
  end

  def edit(conn, %{"id" => id}) do
    henry = Repo.get!(Henry, id)
    changeset = Henry.changeset(henry)
    render(conn, "edit.html", henry: henry, changeset: changeset)
  end

  def update(conn, %{"id" => id, "henry" => henry_params}) do
    henry = Repo.get!(Henry, id)
    changeset = Henry.changeset(henry, henry_params)

    case Repo.update(changeset) do
      {:ok, henry} ->
        conn
        |> put_flash(:info, "Henry updated successfully.")
        |> redirect(to: henry_path(conn, :show, henry))
      {:error, changeset} ->
        render(conn, "edit.html", henry: henry, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    henry = Repo.get!(Henry, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(henry)

    conn
    |> put_flash(:info, "Henry deleted successfully.")
    |> redirect(to: henry_path(conn, :index))
  end
end
