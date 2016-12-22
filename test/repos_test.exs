defmodule ReposTest do
  use ExUnit.Case
  doctest Dlrosi

  import Mock

  test "Repos#list returns ROSI client repos" do
    with_mock Dlrosi.Rosirc, [rosirc: fn -> mock_rosirc end] do
      assert Enum.any?(Dlrosi.Repos.all, &(&1 == {"clients", catalog_client_repo}))
      refute Enum.any?(Dlrosi.Repos.all, &(&1 == {"clients", common_repo}))
    end
  end

  test "Repos#list returns ROSI frontend repos" do
    with_mock Dlrosi.Rosirc, [rosirc: fn -> mock_rosirc end] do
      assert Enum.any?(Dlrosi.Repos.all, &(&1 == {"frontend", ever_lounge_repo}))
      refute Enum.any?(Dlrosi.Repos.all, &(&1 == {"frontend", catalog_client_repo}))
    end
  end

  test "Repos#list returns ROSI service repos" do
    with_mock Dlrosi.Rosirc, [rosirc: fn -> mock_rosirc end] do
      assert Enum.any?(Dlrosi.Repos.all, &(&1 == {"services", catalog_service_repo}))
      refute Enum.any?(Dlrosi.Repos.all, &(&1 == {"frontend", catalog_client_repo}))
    end
  end

  test "Repos#list returns ROSI shared repos" do
    with_mock Dlrosi.Rosirc, [rosirc: fn -> mock_rosirc end] do
      assert Enum.any?(Dlrosi.Repos.all, &(&1 == {"shared", common_repo}))
      refute Enum.any?(Dlrosi.Repos.all, &(&1 == {"frontend", catalog_client_repo}))
    end
  end

  defp mock_rosirc do
    %{
      "apps" => [
        %{"classification" => "client", "name" => "rosi_catalog_client"},
        %{"classification" => "shared", "name" => "rosi_common"},
        %{"classification" => "frontend", "name" => "ever_lounge"},
        %{"classification" => "service", "name" => "rosi_catalog_service"}
      ]
    }
  end

  defp catalog_client_repo do
    %Dlrosi.Repo{name: "rosi_catalog_client", classification: "client"}
  end

  defp common_repo do
    %Dlrosi.Repo{name: "rosi_common", classification: "shared"}
  end

  defp ever_lounge_repo do
    %Dlrosi.Repo{name: "ever_lounge", classification: "frontend"}
  end

  defp catalog_service_repo do
    %Dlrosi.Repo{name: "rosi_catalog_service", classification: "service"}
  end
end
