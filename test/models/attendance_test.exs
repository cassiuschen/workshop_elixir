defmodule Workshop.AttendanceTest do
  use Workshop.ModelCase

  alias Workshop.Attendance

  @valid_attrs %{email: "some content", info: "some content", mobile: "some content", name: "some content", wechat: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Attendance.changeset(%Attendance{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Attendance.changeset(%Attendance{}, @invalid_attrs)
    refute changeset.valid?
  end
end
