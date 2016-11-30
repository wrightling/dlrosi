defmodule Dlrosi.Directories do
  @base_dir  "#{System.user_home}/Dev/stella/web"
  @subdirectories ["clients", "frontend", "services", "shared"]

  def create_directories do
    Enum.map(@subdirectories, &create_subdirectory/1)
    |> Enum.find(:ok, &(is_tuple(&1)))
    |> process_results
  end

  defp create_subdirectory(subdirectory) do
    File.mkdir_p("#{@base_dir}/#{subdirectory}")
  end

  defp process_results(:ok), do: :ok

  defp process_results({:error, reason}) do
    {:error, "Failed to create subdirectories with :#{reason}"}
  end
end
