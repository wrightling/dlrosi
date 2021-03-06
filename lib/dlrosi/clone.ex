defmodule Dlrosi.Clone do
  def clone_repos(repos) do
    # Enum.each(repos, &(clone_repo(&1)))
    repos
    |> Enum.map(&(Task.async(Dlrosi.Clone, :clone_repo, [&1])))
    |> Enum.map(&(Task.await(&1, seconds_to_ms(120))))
  end

  def clone_repo(repo) do
    log_clone_start(repo)
    File.cd!(path_to(repo), fn -> clone(repo) end)
    log_clone_finish(repo)
    :ok
  end

  defp base_dir, do: Dlrosi.Directories.base_dir
  defp seconds_to_ms(s), do: s*1000

  defp path_to(repo), do: "#{base_dir()}/#{subdirectory(repo)}"

  defp git_url({_, repo}), do: repo.remote_repo

  defp subdirectory(repo), do: elem(repo, 0)
  def repo_name({_, repo}), do: repo.name

  defp clone(repo) do
    Git.clone!([git_url(repo), "#{path_to(repo)}/#{repo_name(repo)}"])
  end

  defp format(output) do
    IO.ANSI.format(output)
    |> IO.iodata_to_binary
  end

  def log_clone_start(repo) do
    IO.puts format([:cyan, "[-] ",
                   :default_color, "Cloning ",
                   :magenta, "#{repo_name(repo)} ",
                   :default_color, "into #{path_to(repo)}"])
  end

  def log_clone_finish(repo) do
    IO.puts format([:cyan, "[+] ",
                    :magenta, "#{repo_name(repo)}",
                    :default_color, "...Finished!"])
  end
end
