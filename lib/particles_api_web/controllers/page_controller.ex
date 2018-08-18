defmodule ParticlesApiWeb.PageController do
  use ParticlesApiWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
