defmodule ParticlesApiWeb.ElementView do
  use ParticlesApiWeb, :view
  alias ParticlesApiWeb.ElementView

  def render("index.json", %{elements: elements}) do
    %{data: render_many(elements, ElementView, "element.json")}
  end

  def render("show.json", %{element: element}) do
    %{data: render_one(element, ElementView, "element.json")}
  end

  def render("element.json", %{element: element}) do
    %{id: element.id,
      name: element.name,
      symbol: element.symbol,
      atomic_number: element.atomic_number,
      group: element.group,
      period: element.period}
  end
end
