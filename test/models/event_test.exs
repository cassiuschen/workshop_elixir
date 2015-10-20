defmodule Workshop.EventTest do
  use Workshop.ModelCase

  alias Workshop.Event

  @valid_attrs %{des: "some content", level: "some content", location: "some content", max_count: 42, raw_tags: "some content", requirement: "some content", teacher: "some content", time: "2010-04-17 14:00:00", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Event.changeset(%Event{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Event.changeset(%Event{}, @invalid_attrs)
    refute changeset.valid?
  end
end
