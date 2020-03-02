defmodule BingoWeb.SessionControllerTest do
  use BingoWeb.ConnCase

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "create" do
    test "renders a session when provided credential is valid", %{conn: conn} do
      credential = %{"provider" => "google", "token" => "valid"}
      conn = post(conn, Routes.session_path(conn, :create), credential: credential)
      assert session = json_response(conn, 201)["data"]
      assert session["token"]
      assert session["user"]["name"]
      assert session["user"]["email"]
      assert session["user"]["image"]
    end
  end
end
