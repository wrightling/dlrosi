defmodule Dlrosi.Directories do
  @base_dir  "#{System.user_home}/Dev/stella/web/"
  @root_dirs ["clients", "frontend", "services", "shared"]

  def create_directories do
    create_base_dir
  end

  defp create_base_dir do
    File.mkdir_p(@base_dir)
  end
end
