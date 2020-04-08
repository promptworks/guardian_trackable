defmodule GuardianTrackable.Mixfile do
  use Mix.Project

  def project do
    [
      app: :guardian_trackable,
      package: package(),
      version: "0.2.2",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      preferred_cli_env: [
        "ecto.setup": :test,
        "ecto.reset": :test,
        "ecto.create": :test,
        "ecto.drop": :test,
        "ecto.migrate": :test,
        "ecto.gen.migration": :test
      ]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      description: "A Guardian hook to track user sign in.",
      files: [
        "lib",
        "config",
        "mix.exs",
        "README.md",
        "LICENSE.txt",
        "priv/templates"
      ],
      maintainers: ["Ray Zane"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/promptworks/guardian_trackable"}
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
      {:guardian, "~> 1.0 or ~> 2.0"},
      {:ecto_sql, "~> 3.0"},
      {:plug, ">= 0.0.0", only: [:dev, :test], optional: true},
      {:jason, ">= 0.0.0", only: :test, optional: true},
      {:postgrex, ">= 0.0.0", only: :test, optional: true},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate"],
      "ecto.reset": ["ecto.drop", "ecto.setup"]
    ]
  end
end
