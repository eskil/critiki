defmodule Critiki.Test do
  def test() do
    pages = Critiki.Pages.get_next_visits(1)
    for page <- pages do
      IO.puts(inspect(page))
      IO.puts(page.type)
      IO.puts(page.page_id)
      {:ok, response} = Critiki.Client.get_page(page.type, page.page_id)
      {:ok, doc} = Floki.parse_document(response.body)
    end
  end
end
