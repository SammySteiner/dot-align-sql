require 'sqlite3'

db = SQLite3::Database.open('db/Data.db')

emails = db.execute("SELECT email_address.address_text, person.name FROM email_address JOIN person ON email_address.person_id == person.id;")

puts 'address_text      |   name'
puts "--------------------------"
emails.each do |e|
  puts e[0] + ' | ' + e[1]
end
