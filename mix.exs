defmodule Exsom.Mixfile do
  use Mix.Project

  def project do
    [app: :exsom,
     name: "exsom",

     description: "A thin wrapper for the erlsom XML parsing library",
     package: package,

     version: "0.0.1",
     elixir:  "~> 1.2",

     source_url:   "https://github.com/metalabdesign/exsom",
     homepage_url: "https://github/com/metalabdesign/exsom",

     deps: deps,
     docs: [logo: "./logo.png",
            extras: ["README.md"]]]
  end

  defp deps do
    [{:earmark, "~> 0.1", only: :dev},
     {:ex_doc, "~> 0.10", only: :dev},
     {:erlsom, "~> 1.4"}]
  end

  defp package do
    [maintainers: ["Brooklyn Zelenka", "Steven Vandevelde"],
     licenses: ["LGPLv3"],
     links: %{"GitHub" => "https://github.com/metalabdesign/exsom",
              "Docs" => "http://metalabdesign.github.io/exsom/"}]
  end
end
