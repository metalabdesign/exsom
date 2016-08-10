defmodule ExsomTest do
  use ExUnit.Case
  doctest Exsom

  @test_xml ~S[<foo attr="yo"><bar>1</bar></foo>]


  test "integration / parse and compose (from file)" do
    { :ok, model } = Exsom.XSD.File.parse("test/examples/complex.xsd")
    { :ok, instance, _ } = Exsom.File.parse("test/examples/complex.xml", model)

    { :ok, binary_xml } = Exsom.compose(instance, model, [{ :output, :binary }])
    { :ok, charlist_xml } = Exsom.compose(instance, model, [{ :output, :charlist }])
    { :ok, _ } = Exsom.compose(instance, model, [{ :output, :chardata }])

    assert binary_xml == @test_xml
    assert charlist_xml == to_charlist(@test_xml)

    # TODO: Find a way to test chardata
  end


  test "integration / parse and compose (from memory)" do
    { :ok, model_raw } = File.read("test/examples/complex.xsd")
    { :ok, model } = Exsom.XSD.parse(model_raw)

    { :ok, instance_raw } = File.read("test/examples/complex.xml")
    { :ok, instance, _ } = Exsom.parse(instance_raw, model)

    { :ok, binary_xml } = Exsom.compose(instance, model, [{ :output, :binary }])
    { :ok, charlist_xml } = Exsom.compose(instance, model, [{ :output, :charlist }])

    assert binary_xml == @test_xml
    assert charlist_xml == to_charlist(@test_xml)
  end


  test "unicode / binary -> charlist" do
    charlist_xml = Exsom.Unicode.convert(@test_xml)
    assert charlist_xml == to_charlist(@test_xml)
  end


  test "xsd / model utilities" do
    { :ok, model } = Exsom.XSD.File.parse("test/examples/complex.xsd")

    a = Exsom.XSD.Model.add_xml_schema(model)
    b = Exsom.XSD.Model.merge(model, :erlsom_parseXsd.xsdModel())

    assert a == b
  end

end
