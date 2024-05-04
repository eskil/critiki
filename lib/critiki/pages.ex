defmodule Critiki.Pages do
  import Ecto.Query
  alias Critiki.Schemas.Pages
  alias Critiki.Repo

  def get_seeds() do
    query = from page in Pages,
      where: is_nil(page.source_type),
      where: is_nil(page.source_uuid)

    Repo.all(query)
  end

  def get_next_visits(num \\ 10) do
    query = from(page in Pages,
      where: is_nil(page.visited_at),
      limit: ^num)
    Repo.all(query)
  end
end
