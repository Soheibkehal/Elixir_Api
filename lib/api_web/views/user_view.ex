defmodule TimeManagementWeb.UserView do
  use TimeManagementWeb, :view
  alias TimeManagementWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      avatar: user.avatar,
      email: user.email,
      fname: user.fname,
      lname: user.lname,
      password: user.password}
  end
end
