defmodule ReposTest do
  use ExUnit.Case
  doctest Dlrosi

  test "Repos#list returns ROSI client repos" do
    assert Enum.any?(Dlrosi.Repos.all, &(&1 == {"clients", "rosi_catalog_client"}))
  end

  test "Repos#list returns ROSI frontend repos" do
    assert Enum.any?(Dlrosi.Repos.all, &(&1 == {"frontend", "ever_lounge"}))
  end

  test "Repos#list returns ROSI service repos" do
    assert Enum.any?(Dlrosi.Repos.all, &(&1 == {"services", "rosi_catalog_service"}))
  end

  test "Repos#list returns ROSI shared repos" do
    assert Enum.any?(Dlrosi.Repos.all, &(&1 == {"shared", "rosi_common"}))
  end
end
