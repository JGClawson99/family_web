defmodule HomeworkWeb.Schemas.Types do
  @moduledoc """
  Defines the types for the Schema to use.
  """
  use Absinthe.Schema.Notation

  import_types(Absinthe.Type.Custom)
  import_types(HomeworkWeb.Schemas.UsersSchema)
end
