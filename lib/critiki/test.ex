defmodule Critiki.Test do
  def test() do
    pages = Critiki.Pages.get_next_visits(10)
    for page <- pages do
      IO.puts(inspect(page))
      IO.puts(page.type)
      IO.puts(page.page_id)
      IO.puts(inspect page.wayback_url)

      response = case page.wayback_url do
        nil ->
          {:ok, response} = Critiki.Client.get_page(page.type, page.page_id)
          response
        _ ->
          {:ok, response} = Critiki.Client.get_page(page.wayback_url)
          response
      end
      pattern = ~r{https://www\.critiki\.com/([^"]+)}
      matches = Regex.scan(pattern, response.body)
      IO.puts("matches:")
      for m <- matches do
        IO.inspect m
      end
      urls = Enum.map(matches, fn [_, match] -> match end)
      IO.puts("urls:")
      for u <- urls do
        IO.inspect u
      end
      :ok
      # {:ok, doc} = Floki.parse_document(response.body)
    end
  end
end
