defmodule ZooInventory.Repo do
  use Ecto.Repo, otp_app: :zoo_inventory

  def conf do
    parse_url "ecto://localhost/zoo_inventory_dev"
  end

  def priv do
    app_dir(:zoo_inventory, "priv/repo")
  end
end
