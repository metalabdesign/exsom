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

  # Info about types
  # binary/charlist: http://elixir-lang.org/getting-started/binaries-strings-and-char-lists.html
  # chardata: http://elixir-lang.org/docs/stable/elixir/IO.html#t:chardata/0
  #           = is like a mix of binaries and charlists

  @type binary_xml    :: binary       # XML document in binary form
  @type charlist_xml  :: charlist     # XML document in charlist form
  @type chardata_xml  :: IO.chardata  # XML document in chardata form

  @type xml           :: chardata_xml | charlist_xml | binary_xml
  @type raw_xml       :: chardata_xml | binary_xml

  @type binary_xsd    :: binary       # XSD document in binary form
  @type charlist_xsd  :: charlist     # XSD document in charlist form
  @type chardata_xsd  :: IO.chardata  # XSD document in chardata form

  @type xsd           :: chardata_xsd | charlist_xsd | binary_xsd
  @type raw_xsd       :: chardata_xsd | binary_xsd

  @typedoc "Internal representation of a XML document"
  @type instance      :: struct

  @typedoc "Internal representation of a XSD document"
  @type model         :: any


  # Even more types

  @typedoc "Relative path, relative from project root"
  @type relative_path :: String.t

  @typedoc "A list of characters that follow after the end of the XML document"
  @type rest          :: charlist


  @doc ~S"""
  Parses a XML document, that conforms to a given XSD schema,
  into an internal representation of a XML document (ie. `Exsom.instance`).

  Returns either `{:ok, Struct, Rest}` or `{:error, Error}`.
  Error has the following structure:

      %{
        exception: Exception,   # the exception that was thrown by the program
        stack: Stack,           # representation of the 'stack' that is maintained by `erlsom`
        received: Event         # the SAX event that `erlsom` was processing when it ran into problems
      }
  """
  @type parse_error      :: map # %{:exception, :stack, :received}
  @type parse_failure    :: {:error, parse_error}
  @type parse_success    :: {:ok, Exsom.instance, Exsom.rest}

  @spec parse(
    xml     :: Exsom.xml,
    model   :: Exsom.model,
    opts    :: list
  ) :: Exsom.parse_success
     | Exsom.parse_failure
  def parse(xml, model, opts \\ []), do: :erlsom.scan(xml, model, opts)


  @doc ~S"""
  Translates a structure of records to an XML document. It is the inverse of `scan`
  The output option can be used to specify the format of the output. The possible values are:

  | Atom        | Meaning                                                     |
  |-------------|-------------------------------------------------------------|
  | `:charlist` | [DEFAULT] List of Unicode code points (integers)            |
  | `:chardata` | Deep list of Unicode code points and UTF-8 encoded binaries |
  | `:binary`   | UTF-8 encoded binary                                        |

  """
  @spec compose(
    struct  :: Exsom.instance,
    model   :: Exsom.model,
    opts    :: [{:output, atom}]
  ) :: {atom, Exsom.xml}
  def compose(struct, model, opts \\ []) do
    # a list in erlsom is actually a charlist
    # so: charlist -> list
    opts = Enum.map opts, fn(opt) ->
      {k, v} = opt

      if k == :output && v == :charlist,
        do: {:output, :list},
      else: opt
    end

    :erlsom.write(struct, model, opts)
  end


  @doc ~S"""
  Translate the XML document to a generic data structure based on n-tuples.
  """
  @type simple_format_option    :: {:nameFun, (any, any, any -> any)} | {:output_encoding, :utf8}
  @type simple_format_element   :: {tag :: any, attributes :: any, content :: any}

  @spec simple_format(raw_xml, [simple_format_option]) :: {:ok, simple_format_element, rest}
  def simple_format(xml, opts \\ []), do: :erlsom.simple_form(xml, opts)
end
