# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :homework,
  ecto_repos: [Homework.Repo]

config :cors_plug,
  origin: ["http://localhost:3000"],
  max_age: 86400,
  methods: ["GET", "POST", "DELETE"],
  headers: ["Authorization", "Content-Type", "Accept", "Origin", "User-Agent", "DNT","Cache-Control", "X-Mx-ReqToken", "Keep-Alive", "X-Requested-With", "If-Modified-Since", "Bearer", "X-File-Name", "X-Csrf-Token"],
  expose: ["*"]

# Configures the endpoint
config :homework, HomeworkWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+IjyxgEncWjAVS+ARMn8qUGkijbmXyEp7YTevKL+sfe0dcpJmaaeNXFW8j/By5i9",
  render_errors: [view: HomeworkWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Homework.PubSub,
  live_view: [signing_salt: "4Ka1Trkx"]

# Configures bamboo Mailer
config :homework, Homework.Email,
adapter: Bamboo.SendGridAdapter,
api_key: System.get_env("SENDGRID_API_KEY"),
hackney_opts: [
  recv_timeout: :timer.minutes(1),
  connect_timeout: :timer.minutes(1)
]

config :ex_aws,
  access_key_id: [System.get_env("AWS_ACCESS_KEY"), :instance_role],
  secret_access_key: [System.get_env("AWS_SECRET_ACCESS_KEY"), :instance_role]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
