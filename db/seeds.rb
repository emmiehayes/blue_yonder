LOCATION_LIST = [[ "Boulder", "Colorado", 60, 70],[ "Denver", "Colorado", 90, 100]]

LOCATION_LIST.each do |nick_name, state, low, high|
  Location.create( nick_name: nick_name, state: state, low_temp: low, high_temp: high)
end
