defmodule LiveViewNative.HTML.TemplateRenderTest do
  use ExUnit.Case, async: false

  import Phoenix.ConnTest
  import Phoenix.LiveViewTest
  import LiveViewNativeTest

  @endpoint LiveViewNativeTest.Endpoint

  setup do
    {:ok, conn: Plug.Test.init_test_session(build_conn(), %{})}
  end

  test "can render the override html format", %{conn: conn} do
    {:ok, lv, _body} = native(conn, "/template", :html)

    assert lv |> element("#override-container #template") |> render() =~ "Template HTML Override Render 100"
  end

  test "can render the override html format with mobile target", %{conn: conn} do
    {:ok, lv, _body} = native(conn, "/template", :html, %{"target" => "mobile"})

    assert lv |> element("#mobile-template") |> render() =~ "Mobile Target Template HTML Override Render 100"
  end
end
