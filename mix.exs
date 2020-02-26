defmodule Exmqttc.Mixfile do
  use Mix.Project

  def project do
    [
      app: :exmqttc,
      version: "0.6.1",
      elixir: "~> 1.7",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      docs: [main: "readme.html#usage", extras: ["README.md"]]
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  def package do
    %{
      name: :exmqttc,
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Tim Buchwaldt"],
      description:
        "Elixir wrapper for the emqttc library. Some of the features: Reconnection, offline queueing, gen_* like callback APIs, QoS 0-2.",
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/timbuchwaldt/exmqttc"}
    }
  end

  defp deps do
    [
      {:emqttc,
       git: "https://github.com/emqtt/emqttc.git", ref: "9be166ff1c7deadb2763b5a27c1bba3c635fcee9"},
      {:elixir_uuid, "~> 1.2"},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:dialyxir, "~> 0.5", only: :dev, runtime: false},
      {:credo, "~> 0.10", only: [:dev, :test], runtime: false},
      {:inch_ex, "~> 1.0", only: :dev}
    ]
  end
end
