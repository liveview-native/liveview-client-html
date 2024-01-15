defmodule LiveViewNativeHtml.MixProject do
  use Mix.Project

  @version "0.3.0-beta.1"
  @source_url "https://github.com/liveview-native/live_view_native_html"

  def project do
    [
      app: :live_view_native_html,
      version: @version,
      elixir: "~> 1.15",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      name: name(),
      package: package(),
      docs: docs()
    ]
  end

  # Hex package configuration
  defp package do
    %{
      maintainers: ["Brian Cardarella"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @source_url
      },
      source_url: @source_url
    }
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def name,
    do: "LiveView Naitve HTML"

  def description,
    do: "LiveView Native HTML client"

  defp docs do
    [
      main: "readme",
      source_ref: "v#{@version}",
      extras: ["README.md"]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.24", only: :dev, runtime: false},
      {:makeup_eex, ">= 0.1.1", only: :dev, runtime: false},
      {:floki, ">= 0.30.0", only: :test},
      # {:live_view_native, path: "../live_view_native", override: true},
      {:live_view_native, github: "liveview-native/live_view_native"},
      # {:phoenix_live_view, path: "../phoenix_live_view", override: true},
      {:phoenix_live_view, github: "phoenixframework/phoenix_live_view", ref: "476d1cd288474d7acb33424a74b304b4e9495ff1", override: true},
      # {:live_view_native_test, path: "../live_view_native_test", only: :test}
      {:live_view_native_test, github: "liveview-native/live_view_native_test", only: :test}
    ]
  end
end
