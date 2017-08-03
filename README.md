## About

This repository is a quick way to demo the SQL queries for the DotAlign code challenge.

## Challenge

Given the documented database tables (with some sample data) write a SQL query that...
1. ... lists of each domain in the system
2. ... lists of each email address along with the owner’s real name
3. ... lists each domain and the total number of emails sent to it (combining To, CC, & BCC)

## Installation

In terminal
clone this repository with `git clone 'git@github.com:SammySteiner/dot-align-sql.git'`  
cd into this directory `cd dot-align-sql`  
While using a mac: 
if you do not have an up-to-date version of Ruby, run `brew install ruby`  
if you do not have the bundler gem installed, run  `gem install bundler`  
run `bundle install` to install the required gems  
run `ruby bin/create_and_seed_db.rb` to create and seed the Database  
You're now ready to test out the query files. If you're using Windows, reach out and we'll find a way to set you up to run these files.


## Testing

To view a printout in terminal of the sql queries, input the following commands:
1. ruby lib/sql_query_one.rb
2. ruby lib/sql_query_two.rb
3. ruby lib/sql_query_three.rb

## SQL

The SQL queries for each of the challenges are:
1. SELECT * FROM domain;
2. SELECT email_address.address_text, person.name  
FROM email_address  
JOIN person ON email_address.person_id == person.id;
3. SELECT domain.url_text, COUNT(*) as total_sent  
FROM domain  
JOIN email_address ON domain.id == email_address.domain_id  
JOIN participant ON email_address.id == participant.email_address_id  
WHERE  participant.participant_type_id == 2  
OR participant.participant_type_id == 3  
OR participant.participant_type_id == 4  
GROUP BY domain.url_text;  
