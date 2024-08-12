# LiveViewNative.HTML

> #### Client Spec {: .info}
>
> format: `:html`
>
> module_suffix: `HTML`
>
> template_sigil: `~H`
>
> component: `LiveViewNative.HTML.Component`

## Why?

So why is there a LiveView Native client for HTML if HTML is already supported by LiveView itself? This client
will enable render delegation to an HTML render component for a given LiveView similar to how native clients
delegate their rendering. This allows for a consistent separation of concerns between the LiveView handling and
focused on state management, socket connection, and even handling. Then format-specifc rendering can be isolated
in render components. You don't need to use this library if you prefer the default HTML rendering in LiveView.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `live_view_native_html` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:live_view_native_html, "~> 0.3.0-rc.1"}
  ]
end
```

## Configuration

Add the `HTML` plugin to your list of LiveView Native plugins:

```elixir
config :live_view_native, plugins: [
  LiveViewNative.HTML
]
```

Then in your app's `Native` module you must add the `html` format:

```elixir
defmodule MyAppNative do

  ...

  def live_view() do
    quote do
      use LiveViewNative.LiveView,
        formats: [
          :html,
          :swiftui
        ],
        layouts: [
          html: {MyAppWeb.Layouts, :app},
          swiftui: {MyAppWeb.Layouts.SwiftUI, :app}
        ]

      unquote(verified_routes())
    end
  end

  ...
```

You can also re-run `mix lvn.gen` which will codegen the `Native` module based upon the available LiveView Native plugins.

## Usage

This plugin overrides the default HTML rendering behavior of a Phoenix LiveView. Instead of handling template rendering within the LiveView the rendering is delegated to a renering component. This follows the same rendering delegation pattern found in all LiveView Native client plugins. While LiveView itself can render HTML just fine you may want to organize all clients, including HTML, with the same rendering pattern. This plugin allows for that.

```elixir
defmodule MyAppWeb.HomeLive do
  use MyAppWeb :live_view
  use MyAppNative, :live_view

```

then just like all format LiveView Native rendering components you will create a new module namespaced under the calling module with the `module_suffix` appended:

```elixir
defmodule MyAppWeb.HomeLive.HTML do
  use MyAppNative, [:render_component, :html]
```

Further details on additional options and an explanation of template rendering vs using `render/2` are in the LiveView Native docs.

However, instead of `~LVN` you still use `~H` inside `render/2` functions. You also will use `.heex` as the template extensions instead of `.neex`.

One advantage that using `live_view_native_html` and delegating to render components has over using LiveView's in-module HTML rendering is you get the `target` benefits from LiveView Native. Which means that you could opt to pass along a custom `interface` map with the `LiveSocket` connection in your `app.js`:

```javascript
let innteface = buildInterface(); // your own custom function to populate an interface object
let liveSocket = new LiveSocket("/live", Socket, {params: {_csrf_token: csrfToken, _interface: interface}});
```

now you can use `render/2` in the reder component and pattern match on custom targets or interface values. Perhaps you do some boot time device detection to determine the user is on mobile or not. From our prior example you could add the template `html/home_live+mobile.html.heex` or the function:

```elixir
def render(assigns, %{"target" => "mobile"}) do
   ~H"""
     ...
   """
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/live_view_native_html>.
