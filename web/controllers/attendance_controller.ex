defmodule Workshop.AttendanceController do
  use Workshop.Web, :controller

  alias Workshop.Event
  alias Workshop.Attendance

  plug :controller_name, "attendance"

  plug :scrub_params, "attendance" when action in [:create]

  def index(conn, %{"event_id" => event_id}) do
    post = Repo.get!(Event, event_id) |> Repo.preload [:attendances]
    render(conn, "index.html", event: post)
  end

  def create(conn, %{"event_id" => event_id, "attendance" => attendance_params} ) do
    changeset = Attendance.changeset(%Attendance{}, Map.put(attendance_params, "event_id", event_id))
    event = Repo.get!(Event, event_id)
    case Repo.insert(changeset) do
      {:ok, _event} ->
        conn
        |> put_flash(:info, "参与# {event.title} 的申请已提交！")
        |> redirect(to: event_path(conn, :index))
      {:error, _event} ->
        conn
        |> put_flash(:warning, "参与# {event.title} 的申请提交失败，请重新提交！！")
        |> redirect(to: event_path(conn, :index))
    end
  end

  defp controller_name(conn, name) do
    assign(conn, :controller_name, name)
  end
end