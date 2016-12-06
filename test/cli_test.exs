defmodule CliTest do
  use ExUnit.Case
  doctest Dlrosi

  import Dlrosi.CLI, only: [parse_args: 1]

  test "clone command is parsed properly" do
    assert parse_args(["clone"]) == :clone
  end

  test ":help returned by option parsing with -h and --help options" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end
end
