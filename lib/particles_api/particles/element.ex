defmodule ParticlesApi.Particles.Element do
  use Ecto.Schema
  import Ecto.Changeset


  schema "elements" do
    field :atomic_number, :integer
    field :group, :integer
    field :name, :string
    field :period, :integer
    field :symbol, :string

    timestamps()
  end

  @doc false
  def changeset(element, attrs) do
    element
    |> cast(attrs, [:name, :symbol, :atomic_number, :group, :period])
    |> validate_required([:name, :symbol, :atomic_number, :group, :period])
  end
end
