defmodule Wabanex.IMCTest do
  use ExUnit.Case, async: true

  alias Wabanex.IMC

  describe "calculate/1" do
    test "when the file exists return the data" do
      params = %{"filename" => "students.csv"}

      response = IMC.calculate params

      expected_response = {:ok, %{"Bruno" => 24.930747922437675, "Laiane" => 20.88888888888889}}

      assert response == expected_response
    end

    test "when the wrong filename is given, returns an error" do
      params = %{"filename" => "new.csv"}

      response = IMC.calculate params

      expected_response = {:error, "Error while opening the file"}

      assert response == expected_response
    end
  end
end
