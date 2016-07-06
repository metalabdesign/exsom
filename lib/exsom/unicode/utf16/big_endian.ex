defmodule Exsom.Unicode.UTF16.BigEndian do
  @moduledoc ~S"""
  """

  @doc ~S"""
  """
  @spec convert(data :: any) :: any
  def convert(data), do: :erlsom_ucs.from_utf16be(data)
end
