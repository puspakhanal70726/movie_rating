defmodule Rumbl.BeneController do
  use Rumbl.Web, :controller

  alias Rumbl.Bene

  def index(conn, _params) do
    bene = Repo.all(Bene)
    render(conn, "index.html", bene: bene)
  end

  def new(conn, _params) do
    changeset = Bene.changeset(%Bene{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"bene" => bene_params}) do
    changeset = Bene.changeset(%Bene{}, bene_params)

    case Repo.insert(changeset) do
      {:ok, bene} ->
        conn
        |> put_flash(:info, "Bene created successfully.")
        |> redirect(to: bene_path(conn, :show, bene))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    bene = Repo.get!(Bene, id)
    render(conn, "show.html", bene: bene)
  end

  def edit(conn, %{"id" => id}) do
    bene = Repo.get!(Bene, id)
    changeset = Bene.changeset(bene)
    render(conn, "edit.html", bene: bene, changeset: changeset)
  end

  def update(conn, %{"id" => id, "bene" => bene_params}) do
    bene = Repo.get!(Bene, id)
    changeset = Bene.changeset(bene, bene_params)

    case Repo.update(changeset) do
      {:ok, bene} ->
        conn
        |> put_flash(:info, "Bene updated successfully.")
        |> redirect(to: bene_path(conn, :show, bene))
      {:error, changeset} ->
        render(conn, "edit.html", bene: bene, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    bene = Repo.get!(Bene, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(bene)

    conn
    |> put_flash(:info, "Bene deleted successfully.")
    |> redirect(to: bene_path(conn, :index))
  end
end
