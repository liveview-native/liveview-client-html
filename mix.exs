defmodule LiveViewNativeHtml.MixProject do
  use Mix.Project

  def project do
    [
      app: :live_view_native_html,
      version: "0.1.0",
      elixir: "~> 1.15",
      elixirc_paths: elixirc_paths(Mix.env()),
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

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:live_view_native, path: "../live_view_native"},
      {:phoenix_live_view, path: "../phoenix_live_view", override: true},
      {:live_view_native_test, path: "../live_view_native_test", only: :test}
    ]
  end
end
