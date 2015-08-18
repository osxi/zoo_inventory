defmodule ZooInventory.PageControllerTest do
  use ZooInventory.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
