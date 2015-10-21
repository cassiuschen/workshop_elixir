defmodule Workshop.EventView do
  use Workshop.Web, :view

  def humanize_time(time) do
    time_string = Ecto.DateTime.to_string(time)
    array = String.split(time_string)
    date = String.split(hd(array), "-")
    time = tl array
    hour = hd String.split(hd(time), ":")
    year = hd(date)
    month = hd(date -- [year])
    day = hd(date -- [year, month])
    "#{year}年#{month}月#{day} #{hour}点"
  end
end
