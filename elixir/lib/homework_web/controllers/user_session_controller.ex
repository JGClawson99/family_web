defmodule HomeworkWeb.UserSessionController do
  use HomeworkWeb, :controller

  alias Homework.Accounts
  alias HomeworkWeb.UserAuth

  def create(conn, %{"user" => user_params}) do
    %{"email" => email, "password" => password} = user_params

    if user = Accounts.get_user_by_email_and_password(email, password) do
      UserAuth.log_in_user(conn, user, user_params)
    else
      # In order to prevent user enumeration attacks, don't disclose whether the email is registered.
      # fix this later
      send_resp(conn, 200, "Invalid email or password")
    end
  end

  def delete(conn, _params) do
    conn
    |> put_flash(:info, "Logged out successfully.")
    |> UserAuth.log_out_user()
  end

  def get(conn, _params) do
    conn = UserAuth.fetch_current_user(conn, [])
    conn
    |> send_resp(200, Poison.encode!(conn.assigns.current_user))
  end
end
