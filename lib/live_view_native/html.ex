defmodule LiveViewNative.HTML do
  @moduledoc false

  use LiveViewNative,
    format: :html,
    component: LiveViewNative.HTML.Component,
    module_suffix: :HTML,
    template_engine: Phoenix.LiveView.Engine,
    client: LiveViewNative.HTML.Client
end
