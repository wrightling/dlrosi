defmodule Dlrosi.Repos do
  def all do
    Enum.concat([clients, frontends, services, shared])
  end

  defp clients do
    ["rosi_cart",
     "rosi_catalog_client",
     "rosi_configuration_client",
     "rosi_delia_client",
     "rosi_inventory",
     "rosi_my_business_client",
     "rosi_oms_client",
     "rosi_promotion_client",
     "rosi_subscription_client",
     "rosi_user"]
    |> Enum.map(&({"clients", &1}))
  end

  defp frontends do
    ["customer_commerce",
     "ever_lounge",
     "keep_admin",
     "keep_lounge",
     "keep_www"]
    |> Enum.map(&({"frontend", &1}))
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
end
