defmodule Blog.Repo.Migrations.VisibilityMigration do
  use Ecto.Migration

  def change do
    alter table("posts") do
      add(:published_on, :date)
      add(:visibility, :boolean)
      remove(:subtitle)
    end
  end
end
