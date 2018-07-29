# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Tagging.delete_all
Tag.delete_all
Company.delete_all

Tag.create(
    name: "PHP",
)

Tag.create(
    name: "Ruby",
)

Tag.create(
    name: "Javascript",
)

Tag.create(
    name: "Java",
)

Tag.create(
    name: "ASP.net",
)

Tag.create(
    name: "Scala",
)

Tag.create(
    name: "C",
)

Tag.create(
    name: "Android",
)

tags = Tag.all
puts Cowsay.say "Created #{tags.count} tags", :tux

Company.create(
    name: "FirstCompany",
    address: "510 W Georgia St. Vancouver BC",
    overview: "Its a technology company",
    number_employees: 1000,
    tech_team_size: 500,
    website_url: "www.amazon.com",
    twitter: "#amazon",
    logo_url: "https://sguru.org/wp-content/uploads/2018/02/Amazon-A-Logo.jpg",
    manager: "Jeff Bezos",
    published: true,
    tags: tags.shuffle.slice(0, rand(1..5))
)

Company.create(
    name: "SecondCompany",
    address: "595 Burrard St Vancouver BC",
    overview: "Its a search company",
    number_employees: 800,
    tech_team_size: 200,
    website_url: "www.google.com",
    twitter: "#google",
    logo_url:
    "https://cdn.dribbble.com/users/904380/screenshots/2233565/revised-google-logo.gif",
    manager: "Sunder Pichai",
    published: true,
    tags: tags.shuffle.slice(0, rand(1..5))
)


Company.create(
    name: "ThirdCompany",
    address: "737 Dunsmuir St Vancouver BC",
    overview: "Its a social media company",
    number_employees: 500,
    tech_team_size: 50,
    website_url: "www.facebook.com",
    twitter: "@facebook",
    logo_url:
    "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/F_icon.svg/2000px-F_icon.svg.png",
    manager: "Mark Zuckerberg",
    published: true,
    tags: tags.shuffle.slice(0, rand(1..5))
)

companies = Company.all
puts Cowsay.say "Created #{companies.count} companies", :tux
