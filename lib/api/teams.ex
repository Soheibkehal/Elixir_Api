defmodule TimeManagement.Teams do

  import Ecto.Query, warn: false
  alias TimeManagement.Repo

  ##TEAMS
  alias TimeManagement.Teams.Team

  def list_teams do
    Repo.all(Team)
  end

  def get_team!(id), do: Repo.get!(Team, id)

  def create_team(attrs \\ %{}) do
    %Team{}
    |> Team.changeset(attrs)
    |> Repo.insert()
  end

  def update_team(%Team{} = team, attrs) do
    team
    |> Team.changeset(attrs)
    |> Repo.update()
  end

  def delete_team(%Team{} = team) do
    Repo.delete(team)
  end

  def change_team(%Team{} = team, attrs \\ %{}) do
    Team.changeset(team, attrs)
  end


  ##TEAMUSER TABLE
  alias TimeManagement.Teams.TeamUser

  def list_teams_users do
    Repo.all(TeamUser)
  end

  def get_team_user!(id), do: Repo.get!(TeamUser, id)

  def create_team_user(attrs \\ %{}) do
    %TeamUser{}
    |> TeamUser.changeset(attrs)
    |> Repo.insert()
  end

  def update_team_user(%TeamUser{} = team_user, attrs) do
    team_user
    |> TeamUser.changeset(attrs)
    |> Repo.update()
  end

  def delete_team_user(%TeamUser{} = team_user) do
    Repo.delete(team_user)
  end

  def change_team_user(%TeamUser{} = team_user, attrs \\ %{}) do
    TeamUser.changeset(team_user, attrs)
  end
end
