defmodule HomeworkWeb.Router do
  use HomeworkWeb, :router

  import HomeworkWeb.UserAuth

  pipeline :api do
    plug(:accepts, ["json"])
  end

  pipeline :browser do
    plug(:accepts, ["json"])
  end

  scope "/" do
    pipe_through(:api)

    forward("/graphiql", Absinthe.Plug.GraphiQL,
      schema: HomeworkWeb.Schema,
      interface: :playground,
      context: %{pubsub: HomeworkWeb.Endpoint}
    )
  end

  ## Authentication routes

  scope "/", HomeworkWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    post "/users/register", UserRegistrationController, :create
    post "/users/log_in", UserSessionController, :create
    post "/users/reset_password", UserResetPasswordController, :create
    put "/users/reset_password/:token", UserResetPasswordController, :update
  end

  scope "/", HomeworkWeb do
    pipe_through [:browser, :require_authenticated_user]

    put "/users/settings", UserSettingsController, :update
  end

  scope "/", HomeworkWeb do
    pipe_through [:browser]

    delete "/users/log_out", UserSessionController, :delete
    post "/users/confirm", UserConfirmationController, :create
    post "/users/confirm/:token", UserConfirmationController, :update
  end
end
