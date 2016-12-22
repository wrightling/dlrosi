defmodule ReposTest do
  use ExUnit.Case
  doctest Dlrosi

  import Mock

  test "Repos#list returns ROSI client repos" do
    with_mock Dlrosi.Rosirc, [rosirc: fn -> mock_rosirc end] do
      Enum.each(Dlrosi.Repos.all, &(IO.puts(inspect(&1))))
      assert Enum.any?(Dlrosi.Repos.all,
                       &(&1 == {"clients", catalog_client_repo}))
      refute Enum.any?(Dlrosi.Repos.all,
                       &(&1 == {"clients", %Dlrosi.Repo{name: "rosi_common"}}))
    end
  end

  test "Repos#list returns ROSI frontend repos" do
    with_mock Dlrosi.Rosirc, [rosirc: fn -> mock_rosirc end] do
      assert Enum.any?(Dlrosi.Repos.all,
                       &(&1 == {"frontend", %Dlrosi.Repo{name: "ever_lounge"}}))
    end
  end

  test "Repos#list returns ROSI service repos" do
    with_mock Dlrosi.Rosirc, [rosirc: fn -> mock_rosirc end] do
      assert Enum.any?(Dlrosi.Repos.all,
                       &(&1 == {"services", %Dlrosi.Repo{name: "rosi_catalog_service"}}))
    end
  end

  test "Repos#list returns ROSI shared repos" do
    with_mock Dlrosi.Rosirc, [rosirc: fn -> mock_rosirc end] do
      assert Enum.any?(Dlrosi.Repos.all,
                       &(&1 == {"shared", %Dlrosi.Repo{name: "rosi_common"}}))
    end
  end

  defp mock_rosirc do
    %{
      "ever_frontends" => %{"ever_lounge" => %{}},
      "frontends" => %{"keep_lounge" => %{}},
      "gems" => %{"rosi_common" => %{}},
      "gems" => %{"rosi_catalog_client" => %{":path" => "/bogus/clients/rosi_catalog_client"}},
      "services" => %{"rosi_oms_service" => %{}},
      "services" => %{"rosi_catalog_service" => %{}},
      "integration_suites" => %{"rosi_workflows" => %{}}
    }
  end

  defp catalog_client_repo do
    %Dlrosi.Repo{
      name: "rosi_catalog_client",
      path: "/bogus/web/clients/rosi_catalog_client"
    }
  end

  defp common_repo do
    %Dlrosi.Repo{
      name: "rosi_common",
      path: "/bogus/web/shared/rosi_common"
    }
  end
end
