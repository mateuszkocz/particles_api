defmodule ParticlesApiWeb.ElementController do
  use ParticlesApiWeb, :controller

  alias ParticlesApi.Particles
  alias ParticlesApi.Particles.Element

  action_fallback(ParticlesApiWeb.FallbackController)

  def index(conn, _params) do
    elements = Particles.list_elements()
    render(conn, "index.json", elements: elements)
  end

  def create(conn, %{"element" => element_params}) do
    with {:ok, %Element{} = element} <- Particles.create_element(element_params) do
      conn
      |> put_status(:created)
      |> render("show.json", element: element)
    end
  end

  def show(conn, %{"id" => id}) do
    element = Particles.get_element!(id)
    render(conn, "show.json", element: element)
  end

  def update(conn, %{"id" => id, "element" => element_params}) do
    element = Particles.get_element!(id)

    with {:ok, %Element{} = element} <- Particles.update_element(element, element_params) do
      render(conn, "show.json", element: element)
    end
  end

  def delete(conn, %{"id" => id}) do
    element = Particles.get_element!(id)

    with {:ok, %Element{}} <- Particles.delete_element(element) do
      send_resp(conn, :no_content, "")
    end
  end
end
