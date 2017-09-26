defmodule Dlrosi.CLI do
  def main(argv) do
    enable_ascii_colors()

    argv
    |> parse_args()
    |> process()
  end

  def parse_args(argv) do
    options = OptionParser.parse(argv, switches: [help: :boolean], aliases: [h: :help])
    case options do
      {_, ["clone"], _} -> :clone
      {[help: true], _, _} -> :help
    end
  end

  def process(:clone) do
    Dlrosi.Directories.create_directories
    Dlrosi.Repos.all
    |> Dlrosi.Clone.clone_repos
  end

  def process(:help) do
    IO.puts """
    Commands:
      dlrosi clone          # create project directories and clone all git repos
    """
  end

  # ASII colors are disabled with escript builds, normally
  defp enable_ascii_colors do
    Application.put_env(:elixir, :ansi_enabled, true)
  end
end
