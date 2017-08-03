require 'sqlite3'

db = SQLite3::Database.open('db/Data.db')

domains = db.execute("SELECT * FROM domain;")

puts 'id | url_text'
puts "-------------"
domains.each do |d|
  puts d[0].to_s + '  | ' + d[1]
end
