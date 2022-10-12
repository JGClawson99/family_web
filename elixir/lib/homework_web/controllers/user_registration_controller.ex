defmodule HomeworkWeb.UserRegistrationController do
  use HomeworkWeb, :controller

  alias Homework.Accounts
  alias HomeworkWeb.UserAuth

  def create(conn, %{"user" => user_params}) do
    case Accounts.register_user(user_params) do
      {:ok, user} ->
        # confirm account button will be on a frontend url, it will then send the post :update request the backend
          Accounts.deliver_user_confirmation_instructions(
            user,
            "http://localhost:3000/users/confirm/"<>"some_token"
          )

        conn
        |> put_flash(:info, "User created successfully.")
        |> UserAuth.log_in_user(user)

      {:error, %Ecto.Changeset{} = changeset} ->
        # fix this later
        send_resp(conn, 500, "account already exists")
    end
  end
end
