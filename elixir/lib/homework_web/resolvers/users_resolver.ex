defmodule HomeworkWeb.Resolvers.UsersResolver do
  alias Homework.Accounts

  def user(_root, _args, _info) do
    {:ok, Accounts.get_user_by_email("JacobClawson99@gmail.com")}
  end

end
