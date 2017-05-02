defmodule Coinmarketcap.Mixfile do
  use Mix.Project

  def project do
    [app: :coinmarketcap,
     version: "0.1.0",
     elixir: "~> 1.5-dev",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:hackney, "1.6.1", [override: true]},
      {:httpoison, "~> 0.11.0"},
      {:poison,    "~> 3.1.0"}
    ]
  end
end
