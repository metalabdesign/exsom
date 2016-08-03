defmodule Exsom.XSD do
  @moduledoc ~S"""
  Functions for handling in-memory XSD documents.
  """

  @doc ~S"""
  Parses a XSD document and compiles it into a `Exsom.model`.
  """
  @spec compile(xsd :: Exsom.xsd, []) :: {atom, Exsom.model}
  def compile(xsd, opts \\ []), do: :erlsom.compile_xsd(xsd, opts)

  @doc ~S"""
  """
  @spec find(atom, atom, atom, atom) :: any
  def find(namespace, location, include_dirs, include_list) do
    :erlsom.find(namespace, location, include_dirs, include_list)
  end
end
