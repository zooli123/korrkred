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
  #elso
  [ "Grafitszálak", 2, 1],
  [ "Hulladékkezelés", 2, 1],
  [ "Ipargazdaságtan", 3, 1],
  [ "Marketing", 3, 1],
  [ "Stratégiai menedzsment", 2, 1],
  [ "Alkalmazott statisztika e", 2, 1],
  [ "Alkalmazott statisztika gy", 1, 1],
  [ "Közelítő és szimbolikus számítások I. e", 3, 1],
  [ "Közelítő és szimbolikus számítások I. gy", 1, 1],
  [ "Multimédia e", 3, 1],
  [ "Multimédia gy", 1, 1],
  [ "Operációs rendszerek e", 2, 1],
  [ "Operációs rendszerek gy", 2, 1],
  [ "Programozás I. e", 4, 1],
  [ "Programozás I. gy", 3, 1],

  #masodik
  [ "Számvitel előadás", 3, 2],
  [ "Számvitel gyak", 2, 2],
  [ "Termelésmenedzsment előadás", 1, 2],
  [ "Termelésmenedzsment gyakorlat", 1, 2],
  [ "Stratégiai menedzsment", 2, 2],
  [ "Hulladékkezelés", 2, 2],
  [ "Ipargazdaságtan", 3, 2],

  #harmadik
  [ "Ipargazdaságtan", 3, 3],
  [ "Windows Phone fejlesztés", 3, 3],
  [ "Programozás alapjai", 10, 3],
  [ "Szakdolgozat 1", 5, 3],
  [ "Mestint előadás", 3, 3],
  [ "Számítógép hálózatok e", 2, 3],
  [ "Számítógép hálózatok gy", 2, 3],
  [ "Környezetvédelem és minőségügyi alapismeretek", 2, 3],

  #negyedik
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

semeseters_subject_list = [
  #elso
  [2,1,1],
  [5,1,2],
  [3,1,3],
  [1,1,4],
  [4,1,5],
  [4,1,6],
  [2,1,7],
  [5,1,8],
  [5,1,9],
  [3,1,10],

  [5,2,11],
  [1,2,12],
  [5,2,13],
  [5,2,14],
  [1,2,15],
  [3,1,4],

  #masodik
  [5,3,16],
  [1,3,17],
  [5,3,18],
  [4,3,19],
  [4,3,20],
  [1,3,21],
  [1,3,22],

  [2,4,17],
]

semeseters_subject_list.each do |grade, semester_id, subject_id|
  SemestersSubjects.create(grade: grade, semester_id: semester_id, subject_id: subject_id)
end