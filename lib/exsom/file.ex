defmodule Exsom.File do
  @moduledoc ~S"""
  Functions for manipulating XML directly from a file
  """

  @doc ~S"""
  The same as 'Exsom.scan', but reads directly from a file
  """
  @type scan_error :: map # %{:exception, :stack, :received}

  @spec scan([char], %{}) :: {:ok, struct, [char]} | {:error, scan_error}
  def scan(xml_file, model), do: :erlsom.scan_file(xml_file, model)
end
