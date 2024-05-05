defmodule Critiki.Schemas.Page do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.SoftDelete.Schema

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @required_fields ~w(type page_id)a
  @optional_fields ~w(source_type source_uuid visited_at)a

  schema "pages" do
    field :type, :string
    field :page_id, :string
    field :source_type, :string
    field :source_uuid, Ecto.UUID
    field :wayback_url, :string
    field :visited_at, :naive_datetime

    timestamps()
    soft_delete_schema()
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:page_id)
  end
end
