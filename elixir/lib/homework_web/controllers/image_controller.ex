defmodule HomeworkWeb.ImageController do
  use HomeworkWeb, :controller
  import Plug.Conn

  def upload(conn, %{"image" => %Plug.Upload{} = image}) do
    IO.inspect(conn)
    # a = Map.get(image, :content_type)

    send_resp(conn, 200, "OK")
  end
end
