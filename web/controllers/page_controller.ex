defmodule Workshop.PageController do
  use Workshop.Web, :controller
  plug :controller_name, "static"

  def index(conn, _params) do
    render conn, "index.html"
  end

  defp controller_name(conn, name) do
    assign(conn, :controller_name, name)
  end
end
