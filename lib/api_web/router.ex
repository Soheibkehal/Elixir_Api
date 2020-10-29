defmodule TimeManagementWeb.Router do
  use TimeManagementWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session

  end

  scope "/api", TimeManagementWeb do
    pipe_through :api
    resources "/teams", TeamController, except: [:new, :edit]
    scope "/users" do
      resources "/", UserController, except: [:new, :edit, :index]
      get "/", UserController, :list_users
    end
    scope "/workingtimes" do
      resources "/", WorkingTimeController, except: [:new, :edit, :show, :create]
      post "/:user_id", WorkingTimeController, :create_or_update
      get "/:user_id", WorkingTimeController, :show_by_user_id_with_params
      scope "/:user_id" do
        get "/:id", WorkingTimeController, :show_by_user_id_with_id
      end
    end
    scope "/clocks" do
      get "/:user_id", ClockController, :show_by_user_id
      post "/:user_id", ClockController, :create_by_user_id
    end

  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: TimeManagementWeb.Telemetry
    end
  end
end
