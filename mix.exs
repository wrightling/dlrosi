defmodule Dlrosi.Mixfile do
  use Mix.Project

  def project do
    [app: :dlrosi,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     escript: [main_module: Dlrosi.CLI],
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: apps()]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:git_cli, "~> 0.2.2"},
      {:yaml_elixir, "~> 1.3.0"},
      {:mock, "~> 0.2.0", only: :test}
    ]
  end

  defp apps do
    [
      :logger,
      :yaml_elixir
    ]
  end
end
