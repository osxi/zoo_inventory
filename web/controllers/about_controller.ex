defmodule ZooInventory.AboutController do
  use ZooInventory.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def entity(conn, %{"entity" => entity}) do
    render conn, entity: entity
  end
end
