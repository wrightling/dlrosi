defmodule DirectoriesTest do
  use ExUnit.Case
  doctest Dlrosi

  import Mock
  import Dlrosi.Directories, only: [create_directories: 0]

  test "create_directories asks File to create the directory" do
    with_mock File, [mkdir_p: fn(_dir) -> :ok end] do
      create_directories
      assert called File.mkdir_p("#{System.user_home}/Dev/stella/web/")
    end
  end
end
