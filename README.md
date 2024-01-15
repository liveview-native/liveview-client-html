# LiveViewNative.HTML

> #### Info {: .info}
>
> format: `:html`
>
> module_suffix: `HTML`

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `live_view_native_html` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:live_view_native_html, "~> 0.3.0"}
  ]
end
```

Then add the `HTML` plugin to your list of LiveView Native plugins:

```elixir
config :live_view_native, plugins: [
  LiveViewNative.HTML
]
```

## Usage

This plugin overrides the default HTML rendering behavior of a Phoenix LiveView. Instead of handling template rendering within the LiveView the rendering is delegated to a renering component. This follows the same rendering delegation pattern found in all LiveView Native client plugins. While LiveView itself can render HTML just fine you may want to organize all clients, including HTML, with the same rendering pattern. This plugin allows for that.

```elixir
defmodule MyAppWeb.HomeLive do
  use MyAppWeb :live_view
  use LiveViewNative.LiveView,
    formats: [:html],
    layouts: [
      html: {MyAppWeb.Layouts, :app}
    ]

end
```

then just like all format LiveView Native rendering components you will create a new module namespaced under the calling module with the format appended:

```elixir
defmodule MyAppWeb.HomeLive.HTML do
  use LiveViewNative.Component,
    format: :html
end
```

Further details on additional options and an explanation of template rendering vs using `render/2` are in the LiveView Native docs.

However, instead of `~LVN` you still use `~H` inside `render/2` functions. You also will use `.heex` as the template extensions instead of `.neex`.

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/live_view_native_html>.

