defmodule TimeManagementWeb.TeamUserController do
  use TimeManagementWeb, :controller

  alias TimeManagement.Teams
  alias TimeManagement.Teams.TeamUser

  action_fallback TimeManagementWeb.FallbackController

  def index(conn, _params) do
    teams_users = Teams.list_teams_users()
    render(conn, "index.json", teams_users: teams_users)
  end

  def create(conn, %{"team_user" => team_user_params}) do
    with {:ok, %TeamUser{} = team_user} <- Teams.create_team_user(team_user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.team_user_path(conn, :show, team_user))
      |> render("show.json", team_user: team_user)
    end
  end

  def show(conn, %{"id" => id}) do
    team_user = Teams.get_team_user!(id)
    render(conn, "show.json", team_user: team_user)
  end

  def update(conn, %{"id" => id, "team_user" => team_user_params}) do
    team_user = Teams.get_team_user!(id)

    with {:ok, %TeamUser{} = team_user} <- Teams.update_team_user(team_user, team_user_params) do
      render(conn, "show.json", team_user: team_user)
    end
  end

  def delete(conn, %{"id" => id}) do
    team_user = Teams.get_team_user!(id)

    with {:ok, %TeamUser{}} <- Teams.delete_team_user(team_user) do
      send_resp(conn, :no_content, "")
    end
  end
end
