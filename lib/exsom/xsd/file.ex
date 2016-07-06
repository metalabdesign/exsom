defmodule Exsom.XSD.File do
  @moduledoc ~S"""
  """

  @type opts :: map()

  @doc ~S"""
  """
  @spec compile(xsd :: any, opts) :: any
  def compile(xsd, opts \\ []), do: :erlsom.compile_xsd_file(xsd, opts)

  @doc ~S"""
  """
  @spec add(file :: any, opts) :: any
  def add(file, opts \\ []), do: :erlsom.add_xml_file(file, opts)

  @doc ~S"""
  """
  @spec write(xsd :: any, out :: any, opts) :: any
  def write(xsd, output, opts), do: :erlsom.write_hrl_file(xsd, output, opts)
end
