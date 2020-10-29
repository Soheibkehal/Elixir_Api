defmodule TimeManagementWeb.UserController do
  use TimeManagementWeb, :controller

  alias TimeManagement.Accounts
  alias TimeManagement.Accounts.User

  action_fallback TimeManagementWeb.FallbackController

  ##LISTS
  def list_users(conn, params) do
    if Map.has_key?(params, "email") do
      show_by_email(conn, params)
    else
      index(conn, params)
    end
  end

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end


  ##SHOW
  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def show_by_email(conn, %{"email" => email}) do
    users = Accounts.get_user_by_email(email)
    render(conn, "index.json", users: users)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{} = user} <- Accounts.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
