defmodule Critiki.Repo.Migrations.CreateUnvisited do
  use Ecto.Migration
  import Ecto.SoftDelete.Migration

  def change do
    create table(:pages, primary_key: false) do
      add :id, :uuid, primary_key: true, null: false

      add :type, :string
      add :page_id, :string
      add :source_type, :string
      add :source_uuid, :uuid
      add :wayback_url, :string
      add :visited_at, :naive_datetime

      timestamps()
      soft_delete_columns()
    end
    create unique_index(:pages, [:page_id])
    create unique_index(:pages, [:type, :page_id])
    create unique_index(:pages, [:source_type, :source_uuid])
    create unique_index(:pages, [:visited_at])
  end
end
