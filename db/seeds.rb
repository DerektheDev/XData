# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Practices
Practice.destroy_all
["Sales",
  "Engagement Management",
  "Mobile Solutions",
  "Research & Analysis",
  "Strategy & Ideation",
  "Creative & UI Design",
  "Innovation & Implementation"
].each do |practice|
  Practice.create({
    name: practice
  })
end

# Team Members
TeamMember.destroy_all
iandi = Practice.find_by(name: "Innovation & Implementation")
["Martin Ridgway", "Scott Padgett",
"Michael Gorgone", "Jennifer Siegfried",
"Derek Montgomery"].each do |tm|
  TeamMember.create({
    name: tm,
    practice: iandi
  })
end
# Roles
Role.destroy_all
["Accessibility SME",
"Analytics SME",
"Business Analyst",
"Content Strategist",
"Creative Director",
"Digital Strategist",
"Engagement Leader",
"Mobile Developer",
"Project Manager",
"UI Developer",
"User Researcher",
"UX Architect",
"Visual Designer",
"XD Director",
"UX Interaction Designer",
"Lead Visual Designer",
"Digital Marketing SME",
"Copywriter",
"Information Architect",
"Mobile Architect"].each do |role|
  Role.create({
    name: role,
    standard_rate: 125
  })
end
