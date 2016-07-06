defmodule Exsom.Unicode.UTF8 do
  @moduledoc ~S"""
  """

  @doc ~S"""
  """
  @spec convert(data :: any) :: any
  def convert(data), do: :erlsom_ucs.from_utf8(data)
end
