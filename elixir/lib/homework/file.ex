defmodule Homework.File do

  def upload_file(name, url) do
    MIME.from_path(name)
    |> upload_file(name, url)
  end

  def download_file(name, url) do

  end

  def upload_file("image/png", name, url) do

  end

end
