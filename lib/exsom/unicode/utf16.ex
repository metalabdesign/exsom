defmodule Exsom.Unicode.UTF16 do
  @moduledoc ~S"""
  """

  @doc ~S"""
  """
  @spec convert(data :: any, endian: :little) :: any
  def convert(data, endian: :little), do: Exsom.Unicode.UTF16.LittleEndian.convert(data)

  @doc ~S"""
  """
  @spec convert(data :: any, endian: :big) :: any
  def convert(data, endian: :big), do: Exsom.Unicode.UTF16.BigEndian.convert(data)
end
