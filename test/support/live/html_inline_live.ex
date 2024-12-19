defmodule LiveViewNativeTest.HTML.InlineLive.HTML do
  use LiveViewNative.Component,
    format: :html,
    as: :render

  def render(assigns, %{"target" => "mobile"}) do
    ~H"""
    <div id="mobile-inline">Mobile Target Inline HTML Override Render <%= @count %></div>
    """
  end

  def render(assigns, _interface) do
    ~H"""
    <div id="inline">Inline HTML Override Render <%= @count %></div>
    """
  end
end

defmodule LiveViewNativeTest.HTML.InlineLive do
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
