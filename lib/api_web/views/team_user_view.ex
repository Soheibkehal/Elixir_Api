defmodule TimeManagementWeb.TeamUserView do
  use TimeManagementWeb, :view
  alias TimeManagementWeb.TeamUserView

  def render("index.json", %{teams_users: teams_users}) do
    %{data: render_many(teams_users, TeamUserView, "team_user.json")}
  end

  def render("show.json", %{team_user: team_user}) do
    %{data: render_one(team_user, TeamUserView, "team_user.json")}
  end

  def render("team_user.json", %{team_user: team_user}) do
    %{id: team_user.id}
  end
end
