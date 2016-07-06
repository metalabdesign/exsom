defmodule Exsom.XSD do
  @moduledoc ~S"""
  Functions for reading and writing XSD (schema) files
  """

  @doc ~S"""
  """
  @spec compile(xml, []) :: any
  def compile(xsd, opts \\ []), do: :erlsom.compile_xsd(xsd, opts)

  @doc ~S"""
  """
  @spec find(atom, atom, atom, atom) :: any
  def find(namespace, location, include_dirs, include_list) do
    :erlsom.find(namespace, location, include_dirs, include_list)
  end
end
