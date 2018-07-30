# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PASSWORD = "supersecret"

User.delete_all
Tagging.delete_all
Tag.delete_all
Company.delete_all

super_user = User.create(
	first_name: "Billy",
	last_name: "West",
	email: "bw@future.com",
	password: PASSWORD,
	admin: true
)

10.times do 
	first_name = Faker::Name.first_name
	last_name = Faker::Name.last_name

	User.create(
		first_name: first_name, 
		last_name: last_name,
		email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
    password: PASSWORD
	)
end

users = User.all

puts Cowsay.say "Created #{users.count} users", :kitty

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


# 1
Company.create(
    name: "Javelin Technologies Inc | Vancouver, BC.",
    address: "480 Smithe St #103, Vancouver, BC V6B 5E4",
    overview: "They are experts in 3D and have enabled thousands of Canadian Designers and Manufacturers to aim high with solutions for Electro-mechanical Design, Data Management, and 3D Printing",
    number_employees: 57,
    tech_team_size: 46,
    website_url: "www.javelin-tech.com",
 	twitter: "@javelintech",
 	logo_url: "https://www.javelin-tech.com/3d/wp-content/uploads/javelin-logo-1.png",
    manager: "Ted Lee",
    published: true,
    tags: tags.shuffle.slice(0, rand(1..5))
)

# 2
Company.create(
    name: "Trulioo",
    address: "1055 W Hastings St #1200, Vancouver, BC V6E 2E9",
    overview: "It's product is specialized in helping businesses comply with Anti-Money Laundering (AML) and Know Your Customer (KYC) rules, and supports a diverse range of international electronic identity verification requirements.",
    number_employees: 96,
    tech_team_size: 67,
    website_url: "www.trulioo.com",
 	twitter: "@trulioo",
 	logo_url: "https://www.trulioo.com/wp-content/uploads/trulioo_300.png",
    manager: "Zac Cohen",
    published: true,
    tags: tags.shuffle.slice(0, rand(1..5))
)

# 3
Company.create(
    name: "Backbone Technology Inc.",
    address: "55 E 7th Ave, Vancouver, BC V5T 1M4",
    overview: "Expression Technology supports diverse deployment models and has partnered with the leading cloud service to deliver the comprehensive managed cloud hosting experience.",
    number_employees: 160,
    tech_team_size: 70,
    website_url: "backbone.digital",
 	twitter: "@backboneTech",
 	logo_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9uM0muoccdd8WznDd8CzEewonyGfTd7JfJ0gf-hcTdpEAL5UQSA",
    manager: "Nicole Abuside",
    published: true,
    tags: tags.shuffle.slice(0, rand(1..5))
)

# 4
Company.create(
    name: "A Thinking Ape",
    address: "1132 Alberni St #200, Vancouver, BC V6E 1A5",
    overview: " It creates community-driven games.",
    number_employees: 38,
    tech_team_size: 27,
    website_url: "www.athinkingape.com",
 	twitter: "@athinkingape",
 	logo_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4ViqRxj3qqPUru443sgAr3Q43j9DoVHg0WvBe732QcRLmVVS4",
    manager: "James Gord",
    published: true,
    tags: tags.shuffle.slice(0, rand(1..5))
)


# 5
Company.create(
	name: "Gravit-e Technology",
	address: "525 Seymour St, Vancouver, BC V6B 3K4",
	overview: "Team of business-savvy developers who bring customer’s ideas to life through cloud apps, SaaS, e-commerce solutions and much more",
	number_employees: 180,
    tech_team_size: 93,
    website_url: "www.gravit-e.ca",
    twitter: "@GravTech",
    logo_url: "https://pbs.twimg.com/profile_images/920192919/Picture_55_400x400.png",
    manager: "Tyler Thiesen",
    published: true,
    tags: tags.shuffle.slice(0, rand(1..5))
)

# 6
Company.create(
	name: "Axiom Zen Inc",
	address: "980 Howe St #350, Vancouver, BC V6Z 1N9",
	overview: "Axioms are early innovators in emerging technologies and ideas. It utilize design principles and insights into new technology to create unique and delightful product experiences.",
	number_employees:  95,
    tech_team_size: 53,
    website_url: "www.axiomzen.co",
    twitter: "@AxiomZenTeam", 
    logo_url: "http://www.axiomzen.co/img/logo-axiomzen-blk.svg",
    manager: "Hamilton Helmer",
    published: true,
    tags: tags.shuffle.slice(0, rand(1..5))
)

# 7
Company.create(
	name: "SAV Technology",
	address: "1825 Quebec St #205, Vancouver, BC V5T 4S6",
	overview: "SAV Technology is a leading provider of Vancouver IT solutions for growing organizations. We believe in making IT as simple as possible for our clients.",
	number_employees:  150,
   	tech_team_size: 89,
    website_url: "savtechnology.com",
   	twitter: " @savtechnology", 
    logo_url: "https://savtechnology.com/wp-content/themes/spm/images/logo-savtechnology.png",
    manager: "Tina Ouellette",
    published: true,
    tags: tags.shuffle.slice(0, rand(1..5))
)

# 8
Company.create(
	name: "InTouch Technology",
	address: "1155 W Pender St #601, Vancouver, BC V6E 2P4",
	overview: "Build sales and retention software for health and fitness clubs.",
	number_employees:  170,
   	tech_team_size: 69,
    website_url: "intouchtechnology.com",
   	twitter: "@intouch_tech", 
   	logo_url: "https://intouchtechnology.com/wp-content/uploads/2018/04/sitelogo.png",
    manager: "Bhakti Kshirsagar",  
    published: true,
    tags: tags.shuffle.slice(0, rand(1..5))
)

# 9
Company.create(
	name: "Nucleus Networks",
	address: "425 Hornby St, Vancouver, BC V6C 2Y2",
	overview: "It currently support over 100 organizations in both the public and private sectors across multiple industries.",
    number_employees:  60,
    tech_team_size: 55,
    website_url: "yournucleus.ca",
    twitter: "@yourNucleus", 
    logo_url: "https://yournucleus.ca/wp-content/themes/nucleus/images/logo.png",
    manager: "Wayne",  
    published: true,
    tags: tags.shuffle.slice(0, rand(1..5))
)

# 10
Company.create(
	name: "H+ Technology",
	address: "1130 W Pender St #520, Vancouver, BC V6E 4A4",
	overview: "H+ was founded in 2012 to build holographic platform.",
	number_employees:  25,
   	tech_team_size: 21,
    website_url: "hplustech.com",
   	twitter: "@hplustech",  
    logo_url: "https://pbs.twimg.com/profile_images/660147876610248704/WTmYcQCN_400x400.png",
    manager: "Adson Xie",  
    published: true,
    tags: tags.shuffle.slice(0, rand(1..5))
)







companies = Company.all
puts Cowsay.say "Created #{companies.count} companies", :tux
puts "ADMIN Login with #{super_user.email} and password of '#{PASSWORD}'"