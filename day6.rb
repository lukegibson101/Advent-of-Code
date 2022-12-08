require './input/day6.rb'

def get_first_marker(marker)
  for i in 0..marker.count-1
    marker_list = []
    if i >= 3
      for x in i-3..i
        marker_list << marker[x]
      end
      marker_list = marker_list.uniq
      if marker_list.count == 4
        return puts "Start of packet marker at: #{i+1}"
      end
    end  
  end
end

def get_message_marker(marker)
  for i in 0..marker.count-1
    marker_list = []
    if i >= 13
      for x in i-13..i
        marker_list << marker[x]
      end
      marker_list = marker_list.uniq
      if marker_list.count == 14
        return puts "Start of message marker at: #{i+1}"
      end
    end  
  end
end

get_first_marker(marker)
get_message_marker(marker)