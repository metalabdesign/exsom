defmodule Exsom.Unicode.UTF8 do
  @moduledoc ~S"""
  UTF8 encoding.
  """

  @doc ~S"""
  Decode UTF-8 encoded strings.
  """
  @spec convert(data :: binary | charlist) :: {charlist, any}
  def convert(data), do: :erlsom_ucs.from_utf8(data)
end
