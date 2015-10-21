defmodule Workshop.Attendance do
  use Workshop.Web, :model

  schema "attendances" do
    field :email, :string
    field :name, :string
    field :info, :string
    field :mobile, :string
    field :wechat, :string
    belongs_to :event, Workshop.Event

    timestamps
  end

  @required_fields ~w(email mobile event_id)
  @optional_fields ~w(name info wechat)

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
