defmodule Exsom.XSD do
  @moduledoc ~S"""
  Functions for handling in-memory XSD documents.
  """

  @doc ~S"""
  Parses a XSD document and compiles it into a `Exsom.model`.
  """
  @spec parse(xsd :: Exsom.xsd, []) :: {atom, Exsom.model}
  def parse(xsd, opts \\ []), do: :erlsom.compile_xsd(xsd, opts)

  @doc ~S"""
  This function can be passed to `Exsom.XSD.parse` as the value for the 'include_fun' option.
  It will attempt to retrieve imports, includes and redefines that use an url.
  """
  @spec find(atom, atom, atom, atom) :: any
  def find(namespace, location, include_dirs, include_list) do
    :erlsom_lib.find_xsd(namespace, location, include_dirs, include_list)
  end
end
