defmodule Rumbl.TomController do
  use Rumbl.Web, :controller

  alias Rumbl.Tom

  def index(conn, _params) do
    tom = Repo.all(Tom)
    render(conn, "index.html", tom: tom)
  end

  def new(conn, _params) do
    changeset = Tom.changeset(%Tom{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"tom" => tom_params}) do
    changeset = Tom.changeset(%Tom{}, tom_params)

    case Repo.insert(changeset) do
      {:ok, tom} ->
        conn
        |> put_flash(:info, "Tom created successfully.")
        |> redirect(to: tom_path(conn, :show, tom))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    tom = Repo.get!(Tom, id)
    render(conn, "show.html", tom: tom)
  end

  def edit(conn, %{"id" => id}) do
    tom = Repo.get!(Tom, id)
    changeset = Tom.changeset(tom)
    render(conn, "edit.html", tom: tom, changeset: changeset)
  end

  def update(conn, %{"id" => id, "tom" => tom_params}) do
    tom = Repo.get!(Tom, id)
    changeset = Tom.changeset(tom, tom_params)

    case Repo.update(changeset) do
      {:ok, tom} ->
        conn
        |> put_flash(:info, "Tom updated successfully.")
        |> redirect(to: tom_path(conn, :show, tom))
      {:error, changeset} ->
        render(conn, "edit.html", tom: tom, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    tom = Repo.get!(Tom, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(tom)

    conn
    |> put_flash(:info, "Tom deleted successfully.")
    |> redirect(to: tom_path(conn, :index))
  end
end
