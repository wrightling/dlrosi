defmodule Dlrosi.Repos do
  import Dlrosi.Rosirc, only: [rosirc: 0]

  def all do
    rc = rosirc["apps"]
    Enum.concat([clients(rc), frontends(rc), services(rc), shared(rc)])
  end

  defp clients(rc) do
    rc
    |> filter_by_classification(~r{client})
    |> Enum.map(&({"clients", repo(&1)}))
  end

  defp frontends(rc) do
    rc
    |> filter_by_classification(~r{frontend})
    |> Enum.map(&({"frontend", repo(&1)}))
  end

  defp services(rc) do
    rc
    |> filter_by_classification(~r{service})
    |> Enum.map(&({"services", repo(&1)}))
  end

  defp shared(rc) do
    rc
    |> filter_by_classification(~r{shared})
    |> Enum.map(&({"shared", repo(&1)}))
  end

  defp filter_by_classification(rc, regex) do
    rc |> Enum.filter(&(&1["classification"] =~ regex))
  end

  defp repo(attributes) do
    %Dlrosi.Repo{
      name: attributes["name"],
      remote_repo: attributes["remote_repo"] || "",
      classification: attributes["classification"] || "",
      shortcuts: attributes["shortcuts"] || []
    }
  end
end
