defmodule CloneTest do
  use ExUnit.Case
  doctest Dlrosi

  import Mock
  import Dlrosi.Clone, only: [clone_repo: 1]

  test :clone_repo do
    with_mocks([
                 {Git, [], [clone!: fn(_path) -> :ok end]},
                 {Dlrosi.Directories, [], [base_dir: fn -> "." end]}
               ]) do
      {result, output} = clone_repo({".", "fake_repo_name"})
      assert result == :ok
      assert called Git.clone!(["git@bitbucket.org:stelladot/fake_repo_name.git",
                                "././fake_repo_name"])
    end
  end
end
