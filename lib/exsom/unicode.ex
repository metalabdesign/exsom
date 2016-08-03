defmodule Exsom.Unicode do
  @moduledoc ~S"""
  All things encoding.
  """

  @doc ~S"""
  Tries to detect the encoding. It looks at the first couple of bytes. If these bytes cannot give a definitive answer, it looks into the xml declaration.

  Possible values:

  - ucs4be
  - ucs4le
  - utf16be
  - utf16le
  - utf8
  - iso_8859_1
  """
  @spec detect_encoding(doc :: Exsom.xml) :: {atom, Exsom.binary_xml}
  def detect_encoding(doc), do: :erlsom_lib.detect_encoding(doc)

  @doc ~S"""
  Decodes XML in binary form.
  """
  @spec convert(xml :: Exsom.binary_xml) :: Exsom.charlist_xml
  def convert(xml), do: :erlsom_lib.toUnicode(xml)

  @doc ~S"""
  """
  @spec convert(data :: any, bytes: 8) :: any
  def convert(data, bytes: 8), do: Exsom.Unicode.UTF8.convert(data)

  @doc ~S"""
  """
  @spec convert(data :: any, bytes: 16, endian: :little) :: any
  def convert(data, bytes: 16, endian: :little) do
    Exsom.Unicode.UTF16.LittleEndian.convert(data)
  end

  @doc ~S"""
  """
  @spec convert(data :: any, bytes: 16, endian: :big) :: any
  def convert(data, bytes: 16, endian: :big) do
    Exsom.Unicode.UTF16.BigEndian.convert(data)
  end
end
