defmodule Workshop.Repo.Migrations.CreateEvent do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :title, :string
      add :des, :string
      add :max_count, :integer
      add :level, :string
      add :requirement, :string
      add :location, :string
      add :time, :datetime
      add :teacher, :string
      add :raw_tags, :string

      timestamps
    end

  end
end
