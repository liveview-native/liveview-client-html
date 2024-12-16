defmodule LiveViewNative.HTML.InlineRenderTest do
  use ExUnit.Case, async: false

  import Phoenix.ConnTest
  import LiveViewNativeTest

  @endpoint LiveViewNativeTest.Endpoint

  setup do
    {:ok, conn: Plug.Test.init_test_session(build_conn(), %{})}
  end

  test "can render the override html format", %{conn: conn} do
    {:ok, lv, _body} = live(conn, "/inline")

    assert lv |> element("#override-container #inline") |> render() =~ "Inline HTML Override Render 100"
  end

  test "can render the override html format with mobile target", %{conn: conn} do
    {:ok, lv, _body} = live(conn, "/inline", _interface: %{"target" => "mobile"})

    assert lv |> element("#mobile-inline") |> render() =~ "Mobile Target Inline HTML Override Render 100"
  end
end
