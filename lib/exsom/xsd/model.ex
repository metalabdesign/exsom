defmodule Exsom.XSD.Model do
  # For the cases where a manual schema needs to be supplied
  # (ex. cannot parse)
  def from_map(model), do: :erlsom.add_xsd_model(model)

  def merge(model_1, model_2), do: :erlsom.add_model(model_1, model_2)
end
