# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# Configure the main viewport for the Scenic application
config :touch_screen_scenic, :viewport, %{
  name: :main_viewport,
  size: {480, 320},
  default_scene: {TouchScreenScenic.Scene.Home, nil},
  drivers: [
    %{
      module: Scenic.Driver.Nerves.Rpi
    },
    %{
      module: TouchScreenScenic.Driver,
      opts: [
        device: "ADS7846 Touchscreen",
        calibration: {
          {0.0006739, -0.1291, 505.2},
          {-0.08596, -0.0007315, 336.8}
        }
      ]
    }
  ]
}

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "prod.exs"
