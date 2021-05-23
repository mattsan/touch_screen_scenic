defmodule TouchScreenScenic.MixProject do
  use Mix.Project

  def project do
    [
      app: :touch_screen_scenic,
      version: "0.1.0",
      elixir: "~> 1.7",
      build_embedded: true,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {TouchScreenScenic, []},
      extra_applications: [:crypto]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:scenic, "~> 0.10"},
      {:font_metrics, "~> 0.3.0"},
      {:scenic_driver_nerves_rpi, "~> 0.10.1"},
      {:input_event, "~> 0.4"}
    ]
  end
end
