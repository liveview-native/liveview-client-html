import Config

config :live_view_native, plugins: [
  LiveViewNative.HTML
]

# config :phoenix_template, format_encoders: [
#   html: Phoenix.HTML.Engine
# ]

# config :phoenix, template_engines: [
#   heex: LiveViewNative.Engine
# ]

config :live_view_native_test,
  formats: [:html],
  otp_app: :live_view_native_html,
  routes: [
    %{path: "/inline", module: LiveViewNativeTest.HTML.InlineLive},
    %{path: "/template", module: LiveViewNativeTest.HTML.TemplateLive}
  ]

config :phoenix, :plug_init_mode, :runtime