defmodule Dlrosi.Repos do
  import Dlrosi.Rosirc, only: [rosirc: 0]

  def all do
    rc = rosirc |> flatten_rcs
    Enum.concat([clients(rc), frontends(rc), services, shared])
  end

  defp clients(rc) do
    rc
    |> filter(~r{clients})
    |> Enum.map(&({"clients", repo(&1)}))
  end

  defp frontends(rc) do
    rc
    |> rc_frontends
    |> Enum.map(&({"frontend", repo(&1)}))
  end

  defp services do
    ["rosi_cart_service",
     "rosi_catalog_service",
     "rosi_configuration_service",
     "rosi_credits_service",
     "rosi_delia_service",
     "rosi_email_service",
     "rosi_inventory_service",
     "rosi_mockup_service",
     "rosi_my_business_service",
     "rosi_oms_service",
     "rosi_payment_management_service",
     "rosi_promotion_service",
     "rosi_rewards_service",
     "rosi_scheduler_service",
     "rosi_subscription_service",
     "rosi_tax_service",
     "rosi_ugc_service",
     "rosi_user_service",
     "rosi_virtual_fulfillment_service"]
    |> Enum.map(&({"services", &1}))
  end

  defp shared do
    ["avalara",
     "keep_workflows",
     "rosi_common",
     "rosi_consumer",
     "rosi_faraday_client",
     "rosi_producer",
     "rosi_remote_database_cleaner_server",
     "rosi_workflows"]
    |> Enum.map(&({"shared", &1}))
  end

  defp flatten_rcs(rc) do
    rc
    |> Map.values
    |> Enum.reduce(&(Map.reduce(&1, &2)))
  end

  defp filter(rc, regex) do
    rc
  end

  defp repo({name, attributes}) do
    %Dlrosi.Repo{
      name: name,
      remote_repo: attributes[":remote_repo"] || "",
      path: attributes[":path"] || "",
      shortcuts: attributes[":shortcuts"] || []
    }
  end

  defp rc_frontends(rc) do
    Map.merge(rc["ever_frontends"] || %{}, rc["frontends"] || %{})
  end
end
