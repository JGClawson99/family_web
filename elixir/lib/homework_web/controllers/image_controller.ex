defmodule HomeworkWeb.ImageController do
  use HomeworkWeb, :controller
  import Plug.Conn

  alias Homework.FileManager

  def upload(conn, %{"image" => %Plug.Upload{} = image}) do
    case FileManager.upload(Map.get(image, :filename), Map.get(image, :path)) do
      {:ok, _} ->
        send_resp(conn, 200, "uploaded successfully")
      {:error, _} ->
        send_resp(conn, 200, "failed to upload")
    end
  end

  def get(conn, %{"name" => name, "extension" => extension}) do

    file = FileManager.get(name, extension)
    case file do
      {:ok, image} ->
        conn
        |> put_resp_header("content-type", "image/png")
        |> send_resp(200, Map.get(image, :body))
      _ ->
        send_resp(conn, 200, "failed to get image")
    end
  end

end
