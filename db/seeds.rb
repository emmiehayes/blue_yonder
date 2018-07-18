ADMIN = User.create!(name: 'Emmie', email_address: 'emmiehayes2@gmail.com', password: 'password', role: 1)

USER_LIST = [
            ["Jane", "jane@gmail.com", "password"],
            ["Bob", "bob@gmail.com", "password"],
            ["Lucy", "lucy@gmail.com", "password"],
            ["Jeff", "jeff@gmail.com", "password"],
            ["Michael", "michael@gmail.com", "password"],
            ["Anna", "anna@gmail.com", "password"],
            ["Amy", "amy@gmail.com", "password"],
            ["John", "john@gmail.com", "password"],
            ["Nick", "nick@gmail.com", "password"],
            ["Belle", "belle@gmail.com", "password"],
            ["Jamie", "jamie@gmail.com", "password"],
            ["Jessie", "jessie@gmail.com", "password"],
            ["Blake", "blake@gmail.com", "password"],
            ["Zack", "zack@gmail.com", "password"],
            ["Tom", "tom@gmail.com", "password"],
            ["Emily", "emily@gmail.com", "password"],
            ["Rose", "rose@gmail.com", "password"]
            ]

USER_LIST.each do |name, email, password|
   User.create!(name: name, email_address: email, password: password)
end

LOCATION_LIST = [
                ["Boulder", "Colorado", 10, 20],
                ["Denver", "Colorado", 20, 30],
                ["Steamboat Springs", "Colorado", 40, 50],
                ["Golden", "Colorado", 60, 70],
                ["Salida", "Colorado", 80, 90],
                ["Vail", "Colorado", 90, 100],
                ["Breckenridge", "Colorado", 65, 75],
                ["Telluride", "Colorado", 55, 95],
                ["Fort_Collins", "Colorado", 74, 99],
                ["Colorado_Springs", "Colorado", 75, 80],
                ["Winter_Park", "Colorado", 75, 80],
                ["Crested_Butte", "Colorado", 75, 80],
                ["Fruita", "Colorado", 75, 80],
                ["Estes_Park", "Colorado", 75, 80],
                ["Durango", "Colorado", 75, 80],
                ["Canon City", "Colorado", 75, 80],
                ["Aspen", "Colorado", 75, 80]
                ]

LOCATION_LIST.each do |nick_name, state, low, high|
  Location.create!(nick_name: nick_name, state: state, low_temp: low, high_temp: high)
end

FAVORITE_LIST = [
                [1, 10],
                [2, 9],
                [3, 8],
                [4, 7],
                [5, 6],
                [6, 5],
                [7, 4],
                [8, 3],
                [9, 7],
                [10, 1],
                [11, 12],
                [12, 11],
                [13, 17],
                [14, 15],
                [15, 13],
                [16, 16],
                [17, 10],
                [10, 2],
                [10, 7],
                [10, 17],
                [4, 2],
                [13, 2],
                [13, 17],
                [6, 2]
                ]

FAVORITE_LIST.each do |user_id, location_id|
  Favorite.create!(user_id: user_id, location_id: location_id)
end
