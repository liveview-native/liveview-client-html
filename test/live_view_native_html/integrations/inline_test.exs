defmodule LiveViewNative.HTML.InlineRenderTest do
  use ExUnit.Case, async: false

  import Phoenix.ConnTest
  import Plug.Conn, only: [put_req_header: 3]
  import Phoenix.LiveViewTest

  @endpoint LiveViewNativeTest.Endpoint

  setup do
    {:ok, conn: Plug.Test.init_test_session(build_conn(), %{})}
  end

  test "can render the override html format", %{conn: conn} do
    conn = put_req_header(conn, "accept", "text/html")
    {:ok, lv, _html} = live(conn, "/inline")

    assert lv |> element("#override-container #inline") |> render() =~ "Inline HTML Override Render 100"
  end

  test "can render the override html format with mobile target", %{conn: conn} do
    conn = put_req_header(conn, "accept", "text/html")
    {:ok, lv, _html} = live(conn, "/inline?target=mobile")

    assert lv |> element("#mobile-inline") |> render() =~ "Mobile Target Inline HTML Override Render 100"
  end
end