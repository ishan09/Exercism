defmodule Username do
  def sanitize(username) do
    username
    |> Enum.reduce('', fn c, acc -> 
        acc ++ case c do
          c when c in (?a..?z) ->
            [c]
          ?_ ->
            [c]
          ?ä -> 
            'ae'
          ?ö	 -> 
            'oe'
          ?ü -> 
            'ue'
          ?ß	 -> 
            'ss'
          _ -> 
            ''
      end
    end)
  end
end
