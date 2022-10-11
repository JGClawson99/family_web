defmodule HomeworkWeb.UserRegistrationController do
  use HomeworkWeb, :controller

  alias Homework.Accounts
  alias HomeworkWeb.UserAuth

  def create(conn, %{"user" => user_params}) do
    case Accounts.register_user(user_params) do
      {:ok, user} ->
        {:ok, _} =
          Accounts.deliver_user_confirmation_instructions(
            user,
            &Routes.user_confirmation_url(conn, :edit, &1)
          )

        conn
        |> put_flash(:info, "User created successfully.")
        |> UserAuth.log_in_user(user)

      {:error, %Ecto.Changeset{} = changeset} ->
        # fix this later
        render(conn, "new.html", changeset: changeset)
    end
  end
end
