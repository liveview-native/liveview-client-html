defmodule LiveViewNative.HTML do
  @moduledoc """
  Client module for LiveView Native's HTML plugin
  """
  use LiveViewNative,
    format: :html,
    component: LiveViewNative.HTML.Component,
    module_suffix: :HTML,
    template_engine: Phoenix.LiveView.Engine
end