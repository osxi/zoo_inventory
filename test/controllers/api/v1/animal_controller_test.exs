defmodule ZooInventory.Api.V1.AnimalControllerTest do
  use ZooInventory.ConnCase, async: false

  alias ZooInventory.Animal

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "animals - /index returns array of all animals" do
    animals_json = %Animal{friendly_name: "Grizzy bear"}
    |> Repo.insert!
    |> List.wrap
    |> Poison.encode!

    response = conn(:get, "/api/v1/animals") |> send_request

    assert response.status == 200
    assert response.resp_body == animals_json
  end

  defp send_request(conn) do
    conn
    |> put_private(:plug_skip_csrf_protection, true)
    |> ZooInventory.Endpoint.call([])
  end
end
