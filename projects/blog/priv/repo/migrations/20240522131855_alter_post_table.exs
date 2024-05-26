defmodule Blog.Repo.Migrations.AlterPostTable do
  use Ecto.Migration

  def change do
    alter table("posts") do
      add(:subtitle, :string)
      add(:content, :text)
      remove(:body)
    end
  end
end
