defmodule Rumbl.VideoViewTest do
  use Rumbl.ConnCase, async: true
  import Phoenix.View
  alias Rumbl.User

  test "renders index.html", %{conn: conn} do
    user = Repo.get!(User, 1)
    conn = assign(conn, :current_user, user)

    videos = [
      %Rumbl.Video{ id: 1, title: "dogs"},
      %Rumbl.Video{ id: 2, title: "cats"}
    ]

    conn = get conn, video_path(conn, :index)
    assert html_response(conn, 200) =~ ~r/Listing videos/

    for video <- videos do
      assert String.contains?(conn.resp_body, video.title)
    end
  end

  test "renders new.html", %{conn: conn} do
    changeset = Rumbl.Video.changeset(%Rumbl.Video{})
    categories = [{"cats", 123}]

    content = render_to_string(
      Rumbl.VideoView,
      "new.html",
      conn: conn,
      changeset: changeset,
      categories: categories
    )

    assert String.contains?(content, "New video")
  end

end