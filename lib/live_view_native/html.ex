defmodule LiveViewNative.HTML do
  @behaviour LiveViewNative

  @impl true
  def format, do: :html

  @impl true
  def module_suffix, do: :HTML

  @impl true
  def tag_handler, do: nil

  @impl true
  def component, do: LiveViewNative.HTML.Component
end