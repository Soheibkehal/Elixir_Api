defmodule TimeManagement.TimeManager do

  import Ecto.Query, warn: false
  alias TimeManagement.Repo


  ##CLOCKS
  alias TimeManagement.TimeManager.Clock

  def list_clocks do
    Repo.all(Clock)
  end

  def get_clock!(id), do: Repo.get!(Clock, id)

  def get_clocks_by_user_id(user_id) do
    Repo.one(from c in Clock, where: ^user_id == c.user_id, order_by: [desc: c.id] ,limit: 1)
  end

  def create_clock(attrs \\ %{}) do
    %Clock{}
    |> Clock.changeset(attrs)
    |> Repo.insert()
  end

  def create_clock_by_user_id(attrs \\ %{}) do
    %Clock{}
    |> Clock.changeset(attrs)
    |> Repo.insert()
  end
  def update_clock(%Clock{} = clock, attrs) do
    clock
    |> Clock.changeset(attrs)
    |> Repo.update()
  end

  def delete_clock(%Clock{} = clock) do
    Repo.delete(clock)
  end

  def change_clock(%Clock{} = clock, attrs \\ %{}) do
    Clock.changeset(clock, attrs)
  end


  ##WORKING TIMES
  alias TimeManagement.TimeManager.WorkingTime

  def list_working_times do
    Repo.all(WorkingTime)
  end

  def get_working_time!(id) do
     Repo.get!(WorkingTime, id)
  end

  def get_working_time_by_user_id(user_id, id) do
    Repo.one(from w in WorkingTime, where: ^user_id == w.user_id and ^id == w.id)
  end

  def get_working_time_by_user_id_with_params(user_id, start_params, end_params) do
    Repo.all(from w in WorkingTime, where: ^user_id == w.user_id
      and ^start_params <= w.start
      and ^end_params >= w.end
    )
  end

  def create_working_time(attrs \\ %{}) do
    %WorkingTime{}
    |> WorkingTime.changeset(attrs)
    |> Repo.insert()
  end

  def update_working_time(%WorkingTime{} = working_time, attrs) do
    working_time
    |> WorkingTime.changeset(attrs)
    |> Repo.update()
  end

  def delete_working_time(%WorkingTime{} = working_time) do
    Repo.delete(working_time)
  end

  def change_working_time(%WorkingTime{} = working_time, attrs \\ %{}) do
    WorkingTime.changeset(working_time, attrs)
  end
end
