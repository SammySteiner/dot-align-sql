require 'sqlite3'

db = SQLite3::Database.open('db/Data.db')

domain_count = db.execute("SELECT domain.url_text, COUNT(*) as total_sent
FROM domain
JOIN email_address ON domain.id == email_address.domain_id
JOIN participant ON email_address.id == participant.email_address_id
WHERE  participant.participant_type_id == 2
OR participant.participant_type_id == 3
OR participant.participant_type_id == 4
GROUP BY domain.url_text;")

puts 'url_text  |  total_sent'
puts "--------------------------"
domain_count.each do |dc|
  puts dc[0] + ' | ' + dc[1].to_s
end
