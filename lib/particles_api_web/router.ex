defmodule ParticlesApiWeb.Router do
  use ParticlesApiWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(CORSPlug, origin: "*")
    plug(:accepts, ["json"])
  end

  scope "/", ParticlesApiWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
  end

  # Other scopes may use custom stacks.
  scope "/api", ParticlesApiWeb do
    pipe_through(:api)
    get("/elements", ElementController, :index)
  end
end
