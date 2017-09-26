defmodule DirectoriesTest do
  @base_dir "#{System.user_home}/Dev/stella/web"

  use ExUnit.Case
  doctest Dlrosi

  import Mock
  import Dlrosi.Directories, only: [create_directories: 0]

  test "create_directories returns :error and message on failure" do
    with_mock File, [mkdir_p: fn(_dir) -> {:error, :nonsense} end] do
      assert create_directories() == {:error, "Failed to create subdirectories with :nonsense"}
    end
  end

  test "create_directories asks File to create the directories" do
    with_mock File, [mkdir_p: fn(_dir) -> :ok end] do
      assert create_directories() == :ok
      assert called File.mkdir_p("#{@base_dir}/clients")
      assert called File.mkdir_p("#{@base_dir}/frontend")
      assert called File.mkdir_p("#{@base_dir}/services")
      assert called File.mkdir_p("#{@base_dir}/shared")
    end
  end
end
