defmodule ExsomTest do
  use ExUnit.Case
  doctest Exsom

  @test_xml ~S[<foo attr="yo"><bar>1</bar></foo>]


  test "integration / model -> instance -> write (file)" do
    { :ok, model } = Exsom.XSD.File.compile("test/examples/complex.xsd")
    { :ok, instance, _ } = Exsom.File.scan("test/examples/complex.xml", model)

    { :ok, binary_xml } = Exsom.write(instance, model, [{ :output, :binary }])
    { :ok, charlist_xml } = Exsom.write(instance, model, [{ :output, :charlist }])
    { :ok, _ } = Exsom.write(instance, model, [{ :output, :chardata }])

    assert binary_xml == @test_xml
    assert charlist_xml == to_charlist(@test_xml)

    # TODO: Find a way to test chardata
  end


  test "integration / model -> instance -> write (raw)" do
    { :ok, model_raw } = File.read("test/examples/complex.xsd")
    { :ok, model } = Exsom.XSD.compile(model_raw)

    { :ok, instance_raw } = File.read("test/examples/complex.xml")
    { :ok, instance, _ } = Exsom.scan(instance_raw, model)

    { :ok, binary_xml } = Exsom.write(instance, model, [{ :output, :binary }])
    { :ok, charlist_xml } = Exsom.write(instance, model, [{ :output, :charlist }])

    assert binary_xml == @test_xml
    assert charlist_xml == to_charlist(@test_xml)
  end


  test "unicode / binary -> charlist" do
    charlist_xml = Exsom.Unicode.convert(@test_xml)
    assert charlist_xml == to_charlist(@test_xml)
  end
end
