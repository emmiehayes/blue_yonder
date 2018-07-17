LOCATION_LIST = [["Boulder", "Colorado", 60, 70],["Denver", "Colorado", 90, 100],["Steamboat Springs", "Colorado", 66, 89],["Golden", "Colorado", 95, 90], ["Salida", "Colorado", 65, 78],["Breckenridge", "Colorado", 60, 75]]

LOCATION_LIST.each do |nick_name, state, low, high|
  Location.create( nick_name: nick_name, state: state, low_temp: low, high_temp: high)
end
