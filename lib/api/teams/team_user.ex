defmodule TimeManagement.Teams.TeamUser do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams_users" do
    field :user_id, :id
    field :team_id, :id

    timestamps()
  end

  @doc false
  def changeset(team_user, attrs) do
    team_user
    |> cast(attrs, [])
    |> validate_required([])
  end
end
