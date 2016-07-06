defmodule Exsom.File do
  @moduledoc ~S"""
  Functions for manipulating XML directly from a file
  """

  @doc ~S"""
  The same as 'Exsom.scan', but reads directly from a file
  """
  @type scan_error :: %{:exception, :stack, :received}
  @type scan_success :: {:ok, %Struct{}, [char]}

  @spec scan([char], %{}) :: scan_success | {:error, scan_error}
  def scan(xml_file, model), do: :erlsom.scan_file(xml_file, model)
end
