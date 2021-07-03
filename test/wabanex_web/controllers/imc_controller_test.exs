defmodule WabanexWeb.IMCConrollerTest do
  use WabanexWeb.ConnCase, async: true

  describe "index/2" do
    test "when all params are valid, returns the imc info", %{conn: conn} do
      params = %{filename: "students.csv"}
      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:ok)

      expected_response = %{"result" => %{"Bruno" => 24.930747922437675, "Laiane" => 20.88888888888889}}

      assert response == expected_response
    end

    test "when where there are invalid params, returns an error", %{conn: conn} do
      params = %{filename: "error.csv"}
      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:bad_request)

      expected_response = %{"result" => "Error while opening the file"}

      assert response == expected_response
    end
  end
end
