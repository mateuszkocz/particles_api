defmodule ParticlesApi.Particles do
  @moduledoc """
  The Particles context.
  """

  import Ecto.Query, warn: false
  alias ParticlesApi.Repo

  alias ParticlesApi.Particles.Element

  @doc """
  Returns the list of elements.

  ## Examples

      iex> list_elements()
      [%Element{}, ...]

  """
  def list_elements do
    Repo.all(Element)
  end

  @doc """
  Gets a single element.

  Raises `Ecto.NoResultsError` if the Element does not exist.

  ## Examples

      iex> get_element!(123)
      %Element{}

      iex> get_element!(456)
      ** (Ecto.NoResultsError)

  """
  def get_element!(id), do: Repo.get!(Element, id)

  @doc """
  Creates a element.

  ## Examples

      iex> create_element(%{field: value})
      {:ok, %Element{}}

      iex> create_element(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_element(attrs \\ %{}) do
    %Element{}
    |> Element.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a element.

  ## Examples

      iex> update_element(element, %{field: new_value})
      {:ok, %Element{}}

      iex> update_element(element, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_element(%Element{} = element, attrs) do
    element
    |> Element.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Element.

  ## Examples

      iex> delete_element(element)
      {:ok, %Element{}}

      iex> delete_element(element)
      {:error, %Ecto.Changeset{}}

  """
  def delete_element(%Element{} = element) do
    Repo.delete(element)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking element changes.

  ## Examples

      iex> change_element(element)
      %Ecto.Changeset{source: %Element{}}

  """
  def change_element(%Element{} = element) do
    Element.changeset(element, %{})
  end
end
