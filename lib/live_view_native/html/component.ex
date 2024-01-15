defmodule LiveViewNative.HTML.Component do
  @moduledoc """
  Component module for LiveView Native's HTML plugin

  Using this module will `raise` if `~LVN` is used. Instead
  it will `import` `~H` from `Phoenix.Component` and that should
  be used to write inline templates.
  """

  @doc false
  defmacro __using__(_opts) do
    quote do
      import Phoenix.Component, only: [sigil_H: 2]
    end
  end

  @doc false
  defmacro sigil_LVN(_doc, _modifiers) do
    raise "~LVN is not supported for the HTML format. Please use ~H"
  end
end