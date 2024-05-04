alias Critiki.Repo
alias Critiki.Schemas.Pages

{:ok, _} =
  Pages.changeset(%Pages{}, %{type: "location", page_id: "tonga-room-san-francisco-162"})
  |> Repo.insert
