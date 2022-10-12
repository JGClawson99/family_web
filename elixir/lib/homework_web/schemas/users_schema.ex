defmodule HomeworkWeb.Schemas.UsersSchema do
  @moduledoc """
  Defines the graphql schema for user.
  """
  use Absinthe.Schema.Notation

  object :user do
    field(:email, :string)
    field(:id, :string)
  end

end
