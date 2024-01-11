defmodule LiveViewNative.HTML do
  use LiveViewNative,
    format: :html,
    component: LiveViewNative.HTML.Component,
    module_suffix: :HTML,
    template_engine: Phoenix.LiveView.Engine
end