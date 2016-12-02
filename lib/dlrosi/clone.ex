defmodule Dlrosi.Clone do
  def clone_repos(repos) do
    Enum.each(repos, &(clone_repo(&1)))
  end

  def clone_repo(repo) do
    cwd = File.cwd!

    File.cd!("#{base_dir}/#{subdirectory(repo)}")
    Git.clone!(git_url(repo_name(repo)))
    File.cd!(cwd)
  end

  defp base_dir, do: Dlrosi.Directories.base_dir

  defp git_url(repo_name) do
    "git@bitbucket.org:stelladot/#{repo_name}.git"
  end

  defp subdirectory(repo), do: elem(repo, 0)
  defp repo_name(repo), do: elem(repo, 1)
end
