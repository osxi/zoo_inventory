defmodule ZooInventory.PageController do
  use ZooInventory.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
