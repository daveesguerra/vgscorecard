# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


unless User.find_by_role("admin")
  user = User.create!(first_name: "VanGolfers", last_name: "Admin", name: "vgadmin",  
                      username: "vgadmin", password: "admin222", email: "dee@meplusfood.com", role: "admin", confirmed_at: "2013-01-01")
  puts "Admin succesfully created."
end


course_types = ['Full', 'Par 3', 'Executive']
ct_count = 0

course_types.each do |c|
  unless CourseType.find_by_name(c)
    course_type = CourseType.create!(name: c)
    ct_count = ct_count + 1
  end
end

puts "#{ct_count} course types added successfully."