defmodule Critiki.Repo.Migrations.CreateVisit do
  use Ecto.Migration
  import Ecto.SoftDelete.Migration

  def change do
    create table(:visits, primary_key: false) do
      add :id, :uuid, primary_key: true, null: false

      add :page_uuid, :uuid
      add :type, :string
      add :page_id, :string
      add :html, :text

      timestamps()
      soft_delete_columns()
    end
  end
end
