# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Company.destroy_all
Rails.logger.info "------------------------"
Rails.logger.info "----- FRESH START! -----"
Rails.logger.info "------------------------"
# **************************

# - Insert, read, update, and delete rows in companies table
#   (i.e. full CRUD of company data).

# 1a. check out the schema file
# 1b. check out the model file

puts "companies: #{Company.all.count}"

# 2. insert new rows in companies table
new_company = Company.new
new_company["name"] = "Apple"
new_company["city"] = "Cupertino"
new_company["state"] = "CA"
new_company["url"] = "https://www.apple.com"
new_company.save

puts "companies: #{Company.all.count}"

new_company2 = Company.new
new_company2["name"] = "Amazon"
new_company2["city"] = "Seattle"
new_company2["state"] = "WA"
new_company2.save

puts "companies: #{Company.all.count}"

new_company3 = Company.new
new_company3["name"] = "Twitter"
new_company3["city"] = "San Francisco"
new_company3["state"] = "CA"
new_company3.save

puts "companies: #{Company.all.count}"



# 3. query companies table to find all row with California company

all_companies = Company.all
puts all_companies.inspect

california_companies = Company.where({ "state" => "CA" })
puts california_companies
puts california_companies.inspect
puts "companies in cali: #{california_companies.count}" # companies in cali: 2

# 4. query companies table to find single row for Apple

apple = Company.find_by({ "name" => "Apple" })
puts apple.inspect

# 5. read a row's column value

puts apple["url"]

# 6. update a row's column value
amazon = Company.find_by({ "name" => "Amazon" })
amazon["url"] = "https://www.amazon.com/"
amazon.save

# 7. delete a row

twitter = Company.find_by({ "name" => "Twitter" })
twitter.destroy

# How many rows are in the companies table?
puts "companies: #{Company.all.count}" # companies: 2

amazon["url"] = ""
puts " its url is #{amazon.url}"
