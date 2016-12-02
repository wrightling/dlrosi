defmodule Dlrosi.Clone do
  def clone_repos(repos) do
    repos
    |> Enum.map(&(Task.async(Dlrosi.Clone, :clone_repo, [&1])))
    |> Enum.each(&(Task.await(&1, seconds(60))))
  end

  def clone_repo(repo) do
    File.cd!(path_to(repo), fn -> clone(repo) end)
  end

  defp base_dir, do: Dlrosi.Directories.base_dir
  defp seconds(s), do: s*1000

  defp path_to(repo), do: "#{base_dir}/#{subdirectory(repo)}"

  defp git_url(repo_name) do
    "git@bitbucket.org:stelladot/#{repo_name}.git"
  end

  defp subdirectory(repo), do: elem(repo, 0)
  defp repo_name(repo), do: elem(repo, 1)

  defp clone(repo) do
    Git.clone!([git_url(repo_name(repo)), "#{path_to(repo)}/#{repo_name(repo)}"])
  end
end
