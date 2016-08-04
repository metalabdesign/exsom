defmodule Exsom.XSD.File do
  @moduledoc ~S"""
  Functions for handling XSD files.
  """

  @type opts :: map()

  @doc ~S"""
  Parses a XSD file and compiles it into a `Exsom.model`.
  """
  @spec compile(path :: Exsom.relative_path, opts) :: {atom, Exsom.model}
  def compile(path, opts \\ []), do: :erlsom.compile_xsd_file(path, opts)

  @doc ~S"""
  """
  @spec add(file :: any, opts) :: any
  def add(file, opts \\ []), do: :erlsom.add_xml_file(file, opts)

  @doc ~S"""
  """
  @spec write(xsd :: any, out :: any, opts) :: any
  def write(xsd, output, opts), do: :erlsom.write_hrl_file(xsd, output, opts)
end
