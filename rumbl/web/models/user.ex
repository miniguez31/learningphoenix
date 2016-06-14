defmodule Rumbl.User do
  use Rumbl.Web, :model

  schema "users" do
    field :name, :string
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps
  end

  def changeset(model, params \\:empty) do
    model
    |> cast(params, ~w(name username), [])
    |> validate_length(:username, min: 3, max: 10)
    |> unique_constraint(:username)
  end
end