defmodule CloneTest do
  use ExUnit.Case
  doctest Dlrosi

  import Mock
  import Dlrosi.Clone, only: [clone_repos: 1, clone_repo: 1]

  setup do
    repos = [
      {"clients", "rosi_catalog_client"},
      {"clients", "rosi_user"},
      {"services", "rosi_cart_service"}
    ]

    {:ok, %{repos: repos}}
  end

  test "clone is called properly for a given repo" do
    with_mocks([
                 {Git, [], [clone!: fn(_path) -> :ok end]},
                 {File, [], [cd!: fn(_path) -> :ok end]},
                 {File, [], [cwd!: fn -> "/bogus/path" end]}
               ]) do
      assert clone_repo({"bogus_dir", "fake_repo_name"}) == :ok
      assert called File.cd!("#{Dlrosi.Directories.base_dir}/bogus_dir")
      assert called Git.clone!("git@bitbucket.org:stelladot/fake_repo_name.git")
      assert called File.cd!("/bogus/path")
    end
  end
end
