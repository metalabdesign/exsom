defmodule Exsom.SAX do
  @moduledoc ~S"""
  """

  @doc ~S"""
  """

  @spec parse(xml :: Exsom.chardata_xml, any, fun, any) :: any
  def parse(xml, acc, event_fun, opts), do: :erlsom.parse_sax(xml, acc, event_fun, opts)
end
