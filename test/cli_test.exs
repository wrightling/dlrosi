defmodule CliTest do
  use ExUnit.Case
  doctest Dlrosi

  import Dlrosi.CLI, only: [parse_args: 1]

  test "parse_args returns :ok for anything" do
    assert parse_args(["anything"]) == :go
  end
end
