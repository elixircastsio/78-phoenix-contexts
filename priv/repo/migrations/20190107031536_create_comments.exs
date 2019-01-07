defmodule Teacher.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :body, :string
      add :post_id, references(:posts, on_delete: :delete_all)

      timestamps()
    end

    create index(:comments, [:post_id])
  end
end
