defmodule ParticlesApiWeb.ElementControllerTest do
  use ParticlesApiWeb.ConnCase

  alias ParticlesApi.Particles
  alias ParticlesApi.Particles.Element

  @create_attrs %{
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

  def fixture(:element) do
    {:ok, element} = Particles.create_element(@create_attrs)
    element
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all elements", %{conn: conn} do
      conn = get(conn, element_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create element" do
    test "renders element when data is valid", %{conn: conn} do
      conn = post(conn, element_path(conn, :create), element: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, element_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               "id" => id,
               "atomic_number" => 42,
               "group" => 42,
               "name" => "some name",
               "period" => 42,
               "symbol" => "some symbol"
             }
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, element_path(conn, :create), element: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update element" do
    setup [:create_element]

    test "renders element when data is valid", %{conn: conn, element: %Element{id: id} = element} do
      conn = put(conn, element_path(conn, :update, element), element: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, element_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               "id" => id,
               "atomic_number" => 43,
               "group" => 43,
               "name" => "some updated name",
               "period" => 43,
               "symbol" => "some updated symbol"
             }
    end

    test "renders errors when data is invalid", %{conn: conn, element: element} do
      conn = put(conn, element_path(conn, :update, element), element: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete element" do
    setup [:create_element]

    test "deletes chosen element", %{conn: conn, element: element} do
      conn = delete(conn, element_path(conn, :delete, element))
      assert response(conn, 204)

      assert_error_sent(404, fn ->
        get(conn, element_path(conn, :show, element))
      end)
    end
  end

  defp create_element(_) do
    element = fixture(:element)
    {:ok, element: element}
  end
end
