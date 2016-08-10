defmodule Exsom.XSD.File do
  @moduledoc ~S"""
  Functions for handling XSD files.
  """

  @doc ~S"""
  Parses a XSD file and compiles it into a `Exsom.model`.
  """
  @spec parse(
    path  :: Exsom.relative_path,
    opts  :: list
  ) :: {atom, Exsom.model}
  def parse(path, opts \\ []) do
    :erlsom.compile_xsd_file(path, opts)
  end

  @doc ~S"""
  Parses a XSD file, compiles it into a `Exsom.model`
  and then merges that with an existing model.
  """
  @spec merge(
    path    :: Exsom.relative_path,
    model   :: Exsom.model,
    opts    :: list
  ) :: {:ok, Exsom.model} | {:error, any}
  def merge(path, model, opts \\ []) do
    :erlsom.add_xsd_file(path, opts, model)
  end
end
