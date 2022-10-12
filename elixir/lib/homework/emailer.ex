defmodule Homework.Email do
  use Bamboo.Mailer, otp_app: :homework

  import Bamboo.Email

  @from "JGClawson99@gmail.com"

  def create(recipient, subject, body \\ nil, attrs \\ nil) do
    new_email(
      to: recipient,
      subject: subject,
      text_body: body,
      from: @from
    ) |> do_create(attrs)
  end

  def do_create(email, nil) do
    email
  end

  def do_create(email, []) do
    email
  end

  def do_create(email, [h | t]) do
    {attr, value} = h
    apply(Bamboo.Email, attr, [email, value])
  end

  def send(email = %Bamboo.Email{}) do
    email
    |> deliver_now()
  end
end
