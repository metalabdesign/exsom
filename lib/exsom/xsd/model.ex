defmodule Exsom.XSD.Model do
  @moduledoc ~S"""
  Model utilities.

  For the cases where a manual schema needs to be supplied
  (ex. cannot parse).
  """

  @doc ~S"""
  Adds a simplified version of the W3C XMLSchema to an existing model.
  """
  @spec add_xml_schema(model :: Exsom.model) :: Exsom.model
  def add_xml_schema(model), do: :erlsom.add_xsd_model(model)

  @doc ~S"""
  Merges two models.
  """
  @spec merge(model_1 :: Exsom.model, model_2 :: Exsom.model) :: Exsom.model
  def merge(model_1, model_2), do: :erlsom.add_model(model_1, model_2)
end
