defmodule Workshop.Router do
  use Workshop.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Workshop do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "events", EventController, only: [:index, :edit, :new, :create, :update] do
      resources "attendances", AttendanceController, only: [:create, :index]
    end
  end

  #scope "/api", Workshop do
  #  pipe_through :api

  #  resources, EventController, only: [:index, :edit, :new, :create, :update] do
  #    resources "attendances", AttendanceController, only: [:index, :create]
  #  end
  #end

  # Other scopes may use custom stacks.
  # scope "/api", Workshop do
  #   pipe_through :api
  # end
end
