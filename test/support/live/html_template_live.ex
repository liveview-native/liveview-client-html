defmodule LiveViewNativeTest.HTML.TemplateLive.HTML do
  use LiveViewNative.Component,
    format: :html,
    as: :render
end

defmodule LiveViewNativeTest.HTML.TemplateLive do
  use Phoenix.LiveView,
    layout: {LiveViewNativeTest.HTML.Layouts, :app}

  use LiveViewNative.LiveView,
    formats: [:html],
    layouts: [
      html: {LiveViewNativeTest.HTML.Layouts, :override}
    ],
    dispatch_to: &Module.concat/2

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :count, 100)}
  end

  def render(assigns), do: ~H""
end
