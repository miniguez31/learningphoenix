defmodule Rumbl.UserRepoTest do
  use Rumbl.ModelCase
  alias Rumbl.User

  @valid_attr %{name: "A User", username: "test_user"}

  test "converts unique_contraint on username to error" do
    insert_user(username: "eric")
    attrs = Map.put(@valid_attr, :username, "eric")
    changeset = User.changeset(%User{}, attrs)

    assert {:error, changeset} = Repo.insert(changeset)
    assert {:username, "has already been taken"} in changeset.errors
  end
end