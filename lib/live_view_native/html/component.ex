defmodule LiveViewNative.HTML.Component do
  @moduledoc false

  defmacro __using__(_opts) do
    quote do
      import Phoenix.Component, only: [sigil_H: 2]
    end
  end

  defmacro sigil_LVN(_doc, _modifiers) do
    raise "~LVN is not supported for the HTML format. Please use ~H"
  end
end
