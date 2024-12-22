defmodule LiveViewNativeTest.HTML.TestClient do
  @moduledoc false

  defstruct tags: %{
    form: "form",
    button: "input",
    upload_input: "input",
    changeables: ~w(
      input
      select
      textarea
    )
  }
end
