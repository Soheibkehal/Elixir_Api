defmodule TimeManagement.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :avatar, :string
    field :email, :string
    field :fname, :string
    field :lname, :string
    field :password, :string
    field :role_id, :id

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:avatar, :email, :fname, :lname, :password])
    |> validate_required([:avatar, :email, :fname, :lname, :password])
    |> unique_constraint(:email)
  end
  
end
