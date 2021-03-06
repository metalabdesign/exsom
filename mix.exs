defmodule Exsom.Mixfile do
  use Mix.Project

  def project do
    [app: :exsom,
     name: "exsom",

     description: "XML parser for Elixir (based on Erlsom)",
     package: package,

     version: "0.2.1",
     elixir:  "~> 1.2",

     source_url:   "https://github.com/metalabdesign/exsom",
     homepage_url: "https://github.com/metalabdesign/exsom",

     # build_embedded:  Mix.env == :prod,
     # start_permanent: Mix.env == :prod,

     deps: deps,
     docs: [logo: "./logo.png",
            extras: ["README.md"]]]
  end

   # def application do
   #   [applications: [:logger]]
   # end

  defp deps do
    [{:earmark, "~> 0.1", only: :dev},
     {:erlsom, git: "https://github.com/willemdj/erlsom.git", ref: "9b3f9106a9b1376ab7a4dbdd11cae7bb9835ef0a"},
     {:ex_doc, "~> 0.10", only: :dev}]
  end

  defp package do
    [maintainers: ["Brooklyn Zelenka", "Steven Vandevelde"],
     licenses: ["LGPLv3"],
     links: %{"GitHub" => "https://github.com/metalabdesign/exsom",
              "Docs" => "https://hexdocs.pm/exsom/"}]
  end
end
