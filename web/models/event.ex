defmodule Workshop.Event do
  use Workshop.Web, :model

  schema "events" do
    field :title, :string
    field :des, :string
    field :max_count, :integer
    field :level, :string
    field :requirement, :string
    field :location, :string
    field :time, Ecto.DateTime
    field :teacher, :string
    field :raw_tags, :string

    timestamps
  end

  @required_fields ~w(title max_count level requirement location time)
  @optional_fields ~w(des teacher raw_tags)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

end
