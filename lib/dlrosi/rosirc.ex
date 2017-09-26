defmodule Dlrosi.Rosirc do
  def rosirc do
    path() |> YamlElixir.read_from_file()
  end

  defp path do
    Application.get_env(:dlrosi, :rosirc_path)
  end
end
