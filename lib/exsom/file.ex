defmodule Exsom.File do
  @moduledoc ~S"""
  Functions for handling XML files.
  """

  @doc ~S"""
  Parses a XML file, that conforms to a given XSD schema,
  into an internal representation of a XML document (ie. `Exsom.instance`).
  """
  @spec parse(
    path    :: Exsom.relative_path,
    model   :: Exsom.model
  ) :: Exsom.parse_result
     | Exsom.parse_error
  def parse(path, model), do: :erlsom.scan_file(path, model)
end
