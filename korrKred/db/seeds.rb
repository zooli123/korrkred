# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_list = [
  [ "elso", "a", "User", "First" ],
  [ "masodik", "b", "User", "Second" ],
  [ "harmadik", "c", "User", "Third" ],
  [ "negyedik", "d", "User", "Fourth" ]
]

user_list.each do |login, password, firstname, lastname|
  User.create( login: login, password: password, firstname: firstname, lastname: lastname )
end

semester_list = [
  [ "2015/1", 2015, 1, 1 ],
  [ "2015/2", 2015, 2, 1 ],

  [ "2014/2", 2014, 2, 2 ],
  [ "2015/1", 2015, 1, 2 ],
  [ "2015/2", 2015, 2, 2 ],

  [ "2015/1", 2015, 1, 3 ],
  [ "2015/2", 2015, 2, 3 ],
  [ "2014/1", 2014, 1, 3 ],

  [ "2015/1", 2015, 1, 4 ],
  [ "2015/2", 2015, 2, 4 ],
]

semester_list.each do |title, year, half_year, user_id|
  Semester.create( title: title, year: year, half_year: half_year, user_id: user_id )
end


subject_list = [
  [ "Grafitszálak", 2, 1],
  [ "Hulladékkezelés", 2, 1],
  [ "Ipargazdaságtan", 3, 1],
  [ "Marketing", 3, 1],
  [ "Stratégiai menedzsment", 2, 1],
  [ "Alkalmazott statisztika e", 2, 1],
  [ "Alkalmazott statisztika gy", 1, 1],
  [ "Közelítő és szimbólikus számítások I. e", 3, 1],
  [ "Közelítő és szimbólikus számítások I. gy", 1, 1],
  [ "Multimédia e", 3, 1],
  [ "Multimédia gy", 1, 1],
  [ "Operációs rendszerek e", 2, 1],
  [ "Operációs rendszerek gy", 2, 1],
  [ "Programozás I. e", 4, 1],
  [ "Programozás I. gy", 3, 1],

  [ "Számvitel előadás", 3, 2],
  [ "Számvitel gyak", 2, 2],
  [ "Termelésmenedzsment előadás", 1, 2],
  [ "Termelésmenedzsment gyakorlat", 1, 2],
  [ "Stratégiai menedzsment", 2, 2],
  [ "Hulladékkezelés", 2, 2],
  [ "Ipargazdaságtan", 3, 2],

  [ "Ipargazdaságtan", 3, 3],
  [ "Windows Phone fejlesztés", 3, 3],
  [ "Programozás alapjai", 10, 3],
  [ "Szakdolgozat 1", 5, 3],
  [ "Mestint előadás", 3, 3],
  [ "Számítógép hálózatok e", 2, 3],
  [ "Számítógép hálózatok gy", 2, 3],
  [ "Környezetvédelem és minőségügyi alapismeretek", 2, 3],

  [ "Mestint előadás", 3, 4],
  [ "Ipargazdaságtan", 3, 4],
  [ "Marketing", 3, 4],
  [ "Stratégiai menedzsment", 2, 4],
  [ "Számvitel előadás", 3, 4],
  [ "Számvitel gyak", 2, 4],
  [ "Termelésmenedzsment előadás", 1, 4],
]

subject_list.each do |name, credit, user_id|
  Subject.create( name: name, credit: credit, user_id: user_id )
end

