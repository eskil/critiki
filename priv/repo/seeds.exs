alias Critiki.Repo
alias Critiki.Schemas.Page

{:ok, _} =
  Page.changeset(%Page{}, %{type: "location", page_id: "tonga-room-san-francisco-162"})
  |> Repo.insert
