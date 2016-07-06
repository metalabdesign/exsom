defmodule Exsom.XSD.File do
  @moduledoc ~S"""
  """

  @doc ~S"""
  """
  @spec compile(xsd, opts) :: any
  def compile(xsd, opts \\ []), do: :erlsom.compile_xsd_file(xsd, opts)

  @doc ~S"""
  """
  @spec add(file, opts) :: any
  def add(file, opts \\ []), do: :erlsom.add_xml_file(file, opts)

  @doc ~S"""
  """
  @spec write(xsd, out, opts) :: any
  def write(xsd, output, opts), do: :erlsom.write_hrl_file(xsd, output, opts)
end
