defmodule TimeManagementWeb.WorkingTimeController do
  use TimeManagementWeb, :controller

  alias TimeManagement.TimeManager
  alias TimeManagement.TimeManager.WorkingTime

  action_fallback TimeManagementWeb.FallbackController

  def index(conn, _params) do
    working_times = TimeManager.list_working_times()
    render(conn, "index.json", working_times: working_times)
  end


  ##CREATE
  def create_or_update(conn, params) do
    ##inject user_id into working_time params
    working_time = params["working_time"]
    working_time_with_user_id = Map.put_new(working_time, "user_id", params["user_id"])
    params_with_user_id = Map.put(params, "working_time", working_time_with_user_id)

    if Map.has_key?(params, "id") do
      update_by_user_id(conn, params_with_user_id)
    else
      create(conn, params_with_user_id)
    end
  end

  def create(conn, %{"working_time" => working_time_params}) do
    with {:ok, %WorkingTime{} = working_time} <- TimeManager.create_working_time(working_time_params) do
      conn
      |> put_status(:created)
      |> render("show.json", working_time: working_time)
    end
  end

  ##UPDATE
  def update(conn, %{"id" => id, "working_time" => working_time_params}) do
    working_time = TimeManager.get_working_time!(id)
    with {:ok, %WorkingTime{} = working_time} <- TimeManager.update_working_time(working_time, working_time_params) do
      render(conn, "show.json", working_time: working_time)
    end
  end

  def update_by_user_id(conn, %{"id" => id, "working_time" => working_time_params}) do
    working_time = TimeManager.get_working_time!(id)
    with {:ok, %WorkingTime{} = working_time} <- TimeManager.update_working_time(working_time, working_time_params) do
      render(conn, "show.json", working_time: working_time)
    end
  end


  ##SHOW
  def show_by_user_id_with_params(conn, %{"user_id" => user_id, "start" => start_params, "end" => end_params}) do
    working_times = TimeManager.get_working_time_by_user_id_with_params(user_id, start_params, end_params )
    render(conn, "index.json", working_times: working_times)
  end

  def show_by_user_id_with_id(conn, %{"user_id" =>user_id, "id" => id}) do
    working_time = TimeManager.get_working_time_by_user_id(user_id, id)
    render(conn, "show.json", working_time: working_time)
  end

  def show(conn, %{"id" => id}) do
    working_time = TimeManager.get_working_time!(id)
    render(conn, "show.json", working_time: working_time)
  end


  def delete(conn, %{"id" => id}) do
    working_time = TimeManager.get_working_time!(id)

    with {:ok, %WorkingTime{}} <- TimeManager.delete_working_time(working_time) do
      send_resp(conn, :no_content, "")
    end
  end
end
