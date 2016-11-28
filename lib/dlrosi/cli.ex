defmodule Dlrosi.CLI do
  def run(argv) do
    argv
    |> parse_args
    |> process
  end

  def parse_args(argv) do
    :go
  end

  def process(:go) do
    # create_directories
  end
end
