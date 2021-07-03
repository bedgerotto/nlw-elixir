defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.User

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Bruno", email: "show@show.com", password: "123456"}

      response = User.changeset params

      assert %Ecto.Changeset{
        valid?: true,
        changes: %{name: "Bruno", email: "show@show.com", password: "123456"},
        errors: []
      } = response
    end

    test "when there are invalid, returns an invalid changeset" do
      params = %{name: "B", email: "show@show.com"}

      response = User.changeset params
      expected_errors = %{name: ["should be at least 2 character(s)"], password: ["can't be blank"]}

      assert errors_on(response) == expected_errors
    end
  end
end
