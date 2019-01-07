defmodule TeacherWeb.CommentController do
  use TeacherWeb, :controller

  alias Teacher.Blog

  def create(conn, %{"post_id" => post_id, "comment" => comment_params}) do
    post = Blog.get_post!(post_id)

    case Blog.create_comment(post, comment_params) do
      {:ok, _comment} ->
        conn
        |> put_flash(:info, "Comment created successfully.")
        |> redirect(to: Routes.post_path(conn, :show, post))
      {:error, _changeset} ->
        conn
        |> put_flash(:error, "Issue creating comment.")
        |> redirect(to: Routes.post_path(conn, :show, post))
    end
  end
end
