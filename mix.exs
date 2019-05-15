defmodule Demo.MixProject do
  use Mix.Project

  def project do
    [
      app: :demo,
      version: "0.1.0",
      elixir: "~> 1.8",
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
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      {:phoenix, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},
      {:ecto, "~> 3.0"},
      {:hammer, "~> 6.0"},
      {:distillery, "~> 2.0"},
      {:mongodb, "~> 0.0"},
      {:parse_trans, "~> 3.0"},
      {:mime, "~> 1.0"},
      {:bypass, "~> 1.0", only: :test},
      {:ex_aws, "~> 2.0"},
      {:ex_aws_s3, "~> 2.0"}
    ]
  end
end
