defmodule Exsom.Unicode.UTF16 do
  @moduledoc ~S"""
  """

  @doc ~S"""
  """
  @spec convert(data, endian: :little) :: any
  def convert(data, endian: :little), do: Exsom.Unicode.UTF16.LittleEndian.convert(data)

  @doc ~S"""
  """
  @spec convert(data, endian: :big) :: any
  def convert(data, endian: :big), do: Exsom.Unicode.UTF16.BigEndian.convert(data)
end
