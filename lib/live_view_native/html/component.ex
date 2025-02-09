defmodule LiveViewNative.HTML.Component do
  @moduledoc false

  defmacro __using__(_opts) do
    quote do
      @declarative Phoenix.Component.Declarative
      import LiveViewNative.Component.Declarative, only: []
      import LiveViewNative.Component, only: []
      import Phoenix.Component.Declarative
      import Phoenix.Component
      import Phoenix.Component, except: [
        embed_templates: 2
      ]
      import unquote(__MODULE__)
    end
  end

  defmacro sigil_LVN(_doc, _modifiers) do
    raise "~LVN is not supported for the HTML format. Please use ~H"
  end
end
