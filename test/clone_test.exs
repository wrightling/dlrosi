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
      assert ExUnit.CaptureIO.capture_io(fn -> clone_repo({".", fake_repo()}) end)
        =~ ~r/.*Cloning.*fake_repo_name.*/
      assert called Git.clone!(["git@bitbucket.org:stelladot/fake_repo_name.git",
                                "././fake_repo_name"])
    end
  end

  defp fake_repo do
    %Dlrosi.Repo{name: "fake_repo_name",
      remote_repo: "git@bitbucket.org:stelladot/fake_repo_name.git"
    }
  end
end
