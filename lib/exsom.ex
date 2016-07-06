defmodule Exsom do
  @moduledoc ~S"""
  Exsom is a thin wrapper around the erlsom XML parsing library. Much of the documentation
  has been taken from the `erlsom` documentation, as they are obviously equivalent.

  # Changes from `erlsom`

  Many functions have been renamed and/or broken into modules.
  A user should only need to import the modules that they need,
  and have it be very readable.

  The most common functions get exposed as defaults in the parent module.
  """

  @type xml :: [any] | [char] | binary
  @type raw_xml :: [integer] | binary

  @doc ~S"""
  Equivalent to `erlsom:scan`
  Converts XML that conforms to a XSD into a struct of records.

  Returns either Returns `{:ok, Struct, Rest}` or `{:error, Error}`.
  Error has the following structure:

      %{
        exception: Exception, # the exception that was thrown by the program
        stack: Stack, # representation of the 'stack' that is maintained by `erlsom`
        received: Event # the SAX event that `erlsom` was processing when it ran into problems
      }
  """
  @type scan_error :: map # %{:exception, :stack, :received}

  @spec scan(struct, model :: any, list) :: {:ok, struct, [char]} | {:error, scan_error}
  def scan(xml, model, options \\ []), do: :erlsom.scan(xml, model, options)

  @doc ~S"""
  Translates a structure of records to an XML document. It is the inverse of `parse`
  The output option can be used to specify the format of the output. The possible values are:

  | Atom        | Meaning                                                     |
  |-------------|-------------------------------------------------------------|
  | `:list`     | [DEFAULT] List of Unicode code points (integers)            |
  | `:charlist` | Deep list of Unicode code points and UTF-8 encoded binaries |
  | `:binary`   | UTF-8 encoded binary                                        |

  """
  @type write_option :: {:output, xml}
  @spec write(struct(), any, [write_option]) :: xml
  def write(struct, model, opts \\ []), do: :erlsom.write(struct, model, opts)

  @doc ~S"""
  Translate the XML document to a generic data structure based on n-tuples.
  """

  @type simple_format_option :: {:nameFun, (any, any, any -> any)} | {:output_encoding, :utf8}
  @type simple_format_element :: {tag :: any, attributes :: any, content :: any}
  @type rest :: [char] # Characters following the XML document

  @spec simple_format(raw_xml, [simple_format_option]) :: {:ok, simple_format_element, rest}
  def simple_format(xml, opts \\ []), do: :erlsom.simple_form(xml, opts)
end
