admin = User.create!(name: 'Emmie', email_address: 'emmiehayes2@gmail.com', password: 'password', role: 1)
LOCATION_LIST = [
                ["Boulder", "Colorado", 10, 20],
                ["Denver", "Colorado", 20, 30],
                ["Steamboat Springs", "Colorado", 40, 50],
                ["Golden", "Colorado", 60, 70],
                ["Salida", "Colorado", 80, 90],
                ["Vail", "Colorado", 90, 100],
                ["Breckenridge", "Colorado", 65, 75],
                ["Telluride", "Colorado", 55, 95],
                ["Fort Collins", "Colorado", 74, 99],
                ["Colorado Springs", "Colorado", 75, 80],
                ["Winter Park", "Colorado", 75, 80],
                ["Crested Butte", "Colorado", 75, 80],
                ["Fruita", "Colorado", 75, 80],
                ["Estes Park", "Colorado", 75, 80],
                ["Durango", "Colorado", 75, 80],
                ["Canon City", "Colorado", 75, 80],
                ["Aspen", "Colorado", 75, 80]
                ]

LOCATION_LIST.each do |nick_name, state, low, high|
  Location.create( nick_name: nick_name, state: state, low_temp: low, high_temp: high)
end
