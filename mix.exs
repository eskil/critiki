defmodule Critiki.MixProject do
  use Mix.Project

  def project do
    [
      app: :critiki,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Critiki.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"},
      {:ecto_soft_delete, "~> 2.0"},
      {:tesla, "~> 1.9"},
      {:hackney, "~> 1.20"},
      {:floki, "~> 0.36.0"},
    ]
  end
end
