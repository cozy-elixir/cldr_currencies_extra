defmodule Cldr.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_cldr_currencies_extra,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_cldr, "~> 2.0"},
      {:jason, "~> 1.0", optional: true},
      {:ex_cldr_currencies, "~> 2.0"}
    ]
  end
end
