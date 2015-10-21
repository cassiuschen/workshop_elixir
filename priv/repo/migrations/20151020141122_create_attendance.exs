defmodule Workshop.Repo.Migrations.CreateAttendance do
  use Ecto.Migration

  def change do
    create table(:attendances) do
      add :email, :string
      add :name, :string
      add :info, :string
      add :mobile, :string
      add :wechat, :string
      add :event_id, references(:events)

      timestamps
    end
    create index(:attendances, [:event_id])

  end
end
