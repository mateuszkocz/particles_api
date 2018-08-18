defmodule ParticlesApi.ParticlesTest do
  use ParticlesApi.DataCase

  alias ParticlesApi.Particles

  describe "elements" do
    alias ParticlesApi.Particles.Element

    @valid_attrs %{
      atomic_number: 42,
      group: 42,
      name: "some name",
      period: 42,
      symbol: "some symbol"
    }
    @update_attrs %{
      atomic_number: 43,
      group: 43,
      name: "some updated name",
      period: 43,
      symbol: "some updated symbol"
    }
    @invalid_attrs %{atomic_number: nil, group: nil, name: nil, period: nil, symbol: nil}

    def element_fixture(attrs \\ %{}) do
      {:ok, element} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Particles.create_element()

      element
    end

    test "list_elements/0 returns all elements" do
      element = element_fixture()
      assert Particles.list_elements() == [element]
    end

    test "get_element!/1 returns the element with given id" do
      element = element_fixture()
      assert Particles.get_element!(element.id) == element
    end

    test "create_element/1 with valid data creates a element" do
      assert {:ok, %Element{} = element} = Particles.create_element(@valid_attrs)
      assert element.atomic_number == 42
      assert element.group == 42
      assert element.name == "some name"
      assert element.period == 42
      assert element.symbol == "some symbol"
    end

    test "create_element/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Particles.create_element(@invalid_attrs)
    end

    test "update_element/2 with valid data updates the element" do
      element = element_fixture()
      assert {:ok, element} = Particles.update_element(element, @update_attrs)
      assert %Element{} = element
      assert element.atomic_number == 43
      assert element.group == 43
      assert element.name == "some updated name"
      assert element.period == 43
      assert element.symbol == "some updated symbol"
    end

    test "update_element/2 with invalid data returns error changeset" do
      element = element_fixture()
      assert {:error, %Ecto.Changeset{}} = Particles.update_element(element, @invalid_attrs)
      assert element == Particles.get_element!(element.id)
    end

    test "delete_element/1 deletes the element" do
      element = element_fixture()
      assert {:ok, %Element{}} = Particles.delete_element(element)
      assert_raise Ecto.NoResultsError, fn -> Particles.get_element!(element.id) end
    end

    test "change_element/1 returns a element changeset" do
      element = element_fixture()
      assert %Ecto.Changeset{} = Particles.change_element(element)
    end
  end
end
