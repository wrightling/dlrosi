defmodule Dlrosi.Directories do
  def create_directories do
    Enum.map(subdirectories(), &create_subdirectory/1)
    |> Enum.find(:ok, &(is_tuple(&1)))
    |> process_results
  end

  def base_dir, do: Application.get_env(:dlrosi, :base_dir)
  def subdirectories, do: Application.get_env(:dlrosi, :subdirectories)

  defp create_subdirectory(subdirectory) do
    File.mkdir_p("#{base_dir()}/#{subdirectory}")
  end

  defp process_results(:ok), do: :ok

  defp process_results({:error, reason}) do
    {:error, "Failed to create subdirectories with :#{reason}"}
  end
end
