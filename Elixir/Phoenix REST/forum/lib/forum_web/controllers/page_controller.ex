defmodule ForumWeb.PageController do
  use ForumWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def users(conn, _params) do
    users = [
      %{id: 1, name: "User1", email: "email1"},
      %{id: 2, name: "User2", email: "email2"},
      %{id: 3, name: "User3", email: "email3"}
    ]


    #render(conn, :users, users: users, layout: false)

    #json data for page
    json(conn, %{users: users})
  end
end
