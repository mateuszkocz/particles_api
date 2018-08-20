# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ParticlesApi.Repo.insert!(%ParticlesApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule Properties do
  defp get_props(props, []) do
    props
  end

  defp get_props(props, [element | list]) do
    new_props =
      element
      |> Map.keys()
      |> MapSet.new()
      |> MapSet.union(props)
    get_props(new_props, list)
  end

  def get_properties(list) do
    get_props(MapSet.new(), list)
  end
end

path = Path.expand("priv/repo/elements.json")
{:ok, body} = File.read(path)
{:ok, %{"elements" => elements}} = Poison.decode(body)

props = Properties.get_properties(elements)

IO.inspect MapSet.to_list(props)
