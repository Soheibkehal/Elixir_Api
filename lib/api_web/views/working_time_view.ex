defmodule TimeManagementWeb.WorkingTimeView do
  use TimeManagementWeb, :view
  alias TimeManagementWeb.WorkingTimeView

  def render("index.json", %{working_times: working_times}) do
    %{data: render_many(working_times, WorkingTimeView, "working_time.json")}
  end

  def render("show.json", %{working_time: working_time}) do
    %{data: render_one(working_time, WorkingTimeView, "working_time.json")}
  end

  def render("working_time.json", %{working_time: working_time}) do
    %{id: working_time.id,
      end: working_time.end,
      start: working_time.start}
  end
end
