defmodule HomeworkWeb.Schema do
  @moduledoc """
  Defines the graphql schema for this project.
  """
  use Absinthe.Schema

  alias HomeworkWeb.Resolvers.UsersResolver

  import_types(HomeworkWeb.Schemas.Types)

  query do
    field(:user, :user) do
      resolve(&UsersResolver.user/3)
    end
  end
end
