defmodule LiveViewNativeTest.HTML.InlineLive.HTML do
  use LiveViewNative.Component,
    format: :html,
    as: :render

  def render(assigns, %{"target" => "mobile"}) do
    ~H"""
    <.target id="mobile-inline">Mobile Target Inline HTML Override Render {@count}</.target>
    """
  end

  def render(assigns, _interface) do
    ~H"""
    <.target id="inline">Inline HTML Override Render {@count} %></.target>
    """
  end

  attr :rest, :global
  slot :inner_block
  def target(assigns) do
    ~H"""
    <div {@rest}>{render_slot(@inner_block)}</div>
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
