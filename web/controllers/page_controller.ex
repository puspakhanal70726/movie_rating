defmodule MovieRating.PageController do
  use MovieRating.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
