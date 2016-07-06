defmodule Exsom.Unicode do
  @moduledoc ~S"""
  """

  @doc ~S"""
  """
  @spec detect_encoding(any) :: any
  def detect_encoding(doc), do: :erlsom_lib.detect_encoding(doc)

  @doc ~S"""
  """
  @spec convert(xml) :: any
  def convert(xml), do: :erlsom_lib.toUnicode(xml)

  @doc ~S"""
  """
  @spec convert(data, bytes: 8) :: any
  def convert(data, bytes: 8), do: Exsom.Unicode.UTF8.convert(data)

  @doc ~S"""
  """
  @spec convert(data, bytes: 16, endian: :little) :: any
  def convert(data, bytes: 16, endian: :little) do
    Exsom.Unicode.UTF16.LittleEndian.convert(data)
  end

  @doc ~S"""
  """
  @spec convert(data, bytes: 16, endian: :big) :: any
  def convert(data, bytes: 16, endian: :big) do
    Exsom.Unicode.UTF16.BigEndian.convert(data)
  end
end
