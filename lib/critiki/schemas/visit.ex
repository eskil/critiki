defmodule Critiki.Schemas.Visit do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.SoftDelete.Schema

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @required_fields ~w(page_uuid type page_id)a
  @optional_fields ~w(html)a

  schema "visits" do
    field :page_uuid, Ecto.UUID
    field :type, :string
    field :page_id, :string
    field :html, :string

    timestamps()
    soft_delete_schema()
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:page_uuid)
  end
end
