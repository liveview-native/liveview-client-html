defmodule LiveViewNative.HTML.MixProject do
  use Mix.Project

  @version "0.3.0"
  @source_url "https://github.com/liveview-native/liveview-client-html"

  def project do
    [
      app: :live_view_native_html,
      version: @version,
      elixir: "~> 1.15",
      description: description(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      elixirc_paths: elixirc_paths(Mix.env()),
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:ex_doc, "~> 0.24", only: :dev, runtime: false},
      {:makeup_eex, ">= 0.1.1", only: :dev, runtime: false},
      {:floki, ">= 0.30.0", only: :test},
      {:live_view_native, github: "liveview-native/live_view_native", override: true},
      {:live_view_native_test_endpoint, github: "liveview-native/live_view_native_test_endpoint", branch: "main", only: :test}
    ]
  end

  defp docs do
    [
      extras: ["README.md"],
      main: "readme",
      source_url: @source_url,
      source_ref: "v#{@version}"
    ]
  end

  defp description, do: "LiveView Native HTML client"

  defp package do
    %{
      maintainers: ["Brian Cardarella"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @source_url,
        "Built by DockYard, Expert Elixir & Phoenix Consultants" => "https://dockyard.com/phoenix-consulting"
      }
    }
  end
end
