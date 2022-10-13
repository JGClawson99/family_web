defmodule Homework.FileManager do

  def upload(name, url) do
    url
    |> ExAws.S3.Upload.stream_file
    |> ExAws.S3.upload("elixir-web-test", name)
    |> ExAws.request
  end

  def download(name, url) do

  end

  def get(id, extension) do
    ExAws.S3.get_object("elixir-web-test", "Jess.jpg")
    |> ExAws.request()
    |> IO.inspect()
  end

end
