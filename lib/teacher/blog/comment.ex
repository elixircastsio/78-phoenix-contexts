defmodule Teacher.Blog.Comment do
  use Ecto.Schema
  import Ecto.Changeset


  schema "comments" do
    field :body, :string
    belongs_to :post, Teacher.Blog.Post

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:body])
    |> validate_required([:body])
  end
end
