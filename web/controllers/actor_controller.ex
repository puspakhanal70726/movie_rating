defmodule Rumbl.ActorController do
  use Rumbl.Web, :controller

  alias Rumbl.Actor

  def index(conn, _params) do
    actor = Repo.all(Actor)
    render(conn, "index.html", actor: actor)
  end

  def new(conn, _params) do
    changeset = Actor.changeset(%Actor{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"actor" => actor_params}) do
    changeset = Actor.changeset(%Actor{}, actor_params)

    case Repo.insert(changeset) do
      {:ok, actor} ->
        conn
        |> put_flash(:info, "Actor created successfully.")
        |> redirect(to: actor_path(conn, :show, actor))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    actor = Repo.get!(Actor, id)
    render(conn, "show.html", actor: actor)
  end

  def edit(conn, %{"id" => id}) do
    actor = Repo.get!(Actor, id)
    changeset = Actor.changeset(actor)
    render(conn, "edit.html", actor: actor, changeset: changeset)
  end

  def update(conn, %{"id" => id, "actor" => actor_params}) do
    actor = Repo.get!(Actor, id)
    changeset = Actor.changeset(actor, actor_params)

    case Repo.update(changeset) do
      {:ok, actor} ->
        conn
        |> put_flash(:info, "Actor updated successfully.")
        |> redirect(to: actor_path(conn, :show, actor))
      {:error, changeset} ->
        render(conn, "edit.html", actor: actor, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    actor = Repo.get!(Actor, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(actor)

    conn
    |> put_flash(:info, "Actor deleted successfully.")
    |> redirect(to: actor_path(conn, :index))
  end
end
