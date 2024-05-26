defmodule Blog.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field(:title, :string)
    field(:content, :string)
    field(:published_on, :date)
    field(:visibility, :boolean)
    has_many(:comments, Blog.Comments.Comment)
    belongs_to(:user, Blog.Accounts.User)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :published_on, :visibility, :content, :user_id])
    |> validate_required([:title, :content, :visibility, :user_id])
    |> unique_constraint(:title)
    |> foreign_key_constraint(:user_id)
  end
end
