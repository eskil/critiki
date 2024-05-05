defmodule Critiki.Client do
  use Tesla

  plug Tesla.Middleware.FollowRedirects, max_redirects: 3

  @source_url "https://web.archive.org/web/20220628150847/https://www.critiki.com"

  def get_page(type, page) do
    get(@source_url <> "/" <> type <> "/" <> page)
  end
end
