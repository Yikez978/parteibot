defmodule Parteibot.Router do
  use Parteibot.Web, :router

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

  scope "/", Parteibot do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/twitter_accounts", TwitterAccountController
    resources "/hashtags",         HashtagController
    resources "/reply_messages",   ReplyMessageController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Parteibot do
  #   pipe_through :api
  # end
end
