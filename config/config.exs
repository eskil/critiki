import Config

config :critiki, Critiki.Repo,
  database: "critiki_repo_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :critiki, ecto_repos: [Critiki.Repo]
