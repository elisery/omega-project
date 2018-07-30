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



Company.create(
    name: "Amazon",
    address: "510 W Georgia St. Vancouver BC",
    overview: "Its a technology company",
    number_employees: 1000,
    tech_team_size: 500,
    website_url: "www.amazon.com",
    twitter: "@amazon",
    logo_url: "https://sguru.org/wp-content/uploads/2018/02/Amazon-A-Logo.jpg",
    manager: "Jeff Bezos",
    published: true,
    tags: tags.shuffle.slice(0, rand(1..5))
)

Company.create(
    name: "Google",
    address: "595 Burrard St Vancouver BC",
    overview: "Its a search company",
    number_employees: 800,
    tech_team_size: 200,
    website_url: "www.google.com",
    twitter: "@google",
    logo_url:
    "http://diylogodesigns.com/blog/wp-content/uploads/2016/04/google-logo-icon-PNG-Transparent-Background.png",
    manager: "Sunder Pichai",
    published: true,
    tags: tags.shuffle.slice(0, rand(1..5))
)



# 8
Company.create(
    name: "Facebook",
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

Company.create(
    name: "Twitter",
    address: "800 Robson St Vancouver BC",
    overview: "Its a social media company",
    number_employees: 400,
    tech_team_size: 110,
    website_url: "www.twitter.com",
    twitter: "@Twitter",
    logo_url:
    "https://www.saydaily.com/.image/t_share/MTM0ODg3OTkwOTMyNTc1NTA2/screen-shot-2015-12-03-at-22820-pmpng.png",
    manager: "Jack Dorsey",
    published: true,
    tags: tags.shuffle.slice(0, rand(1..5))
)

Company.create(
    name: "Neurio Technology Inc.",
    address: "43 W Hastings St Vancouver BC",
    overview: "From industry leading energy monitoring and control technology to sophisticated analytics, we are changing how energy is used and managed in a home.",
    number_employees: 150,
    tech_team_size: 50,
    website_url: "https://www.neur.io/",
    twitter: "@NeurioHome",
    logo_url: "https://media.glassdoor.com/sqll/1098406/neurio-technology-squarelogo-1479643872709.png",
    manager: "Keith Marett",
    published: true,
    tags: tags.shuffle.slice(0, rand(1..5))
)

Company.create(
    name: "QuickMobile Inc.",
    address: "1177 W Hastings St Vancouver BC",
    overview: "At QuickMobile, we’re re-defining events by designing mobile event apps for today’s tech-savvy attendee. Our apps for events and conferences create meaningful and lasting experiences for our customers and their attendees. By delivering personalized, productive and fully-integrated events and meetings—across the enterprise and beyond—we give your customers the ability to captivate and engage their attendees. With unparalleled expertise and support, QuickMobile makes it happen.",
    number_employees: 110,
    tech_team_size: 60,
    website_url: "https://www.quickmobile.com/",
    twitter: "@QuickMobile",
    logo_url: "https://images.g2crowd.com/uploads/product/image/large_detail/large_detail_1531152383/quickmobile-by-cvent.png",
    manager: "David Smith",
    published: true,
    tags: tags.shuffle.slice(0, rand(1..5))
)

Company.create(
    name: "Elastic Path Software Inc",
    address: "745 Thurlow Street Vancouver BC",
    overview: "Elastic Path customers are innovators who seek the ultimate in flexibility and business agility. We help these innovators generate billions in revenue with our patented ecommerce technologies. Elastic Path's flexible enterprise commerce software seamlessly brings omnichannel ecommerce directly into marketing clouds and experience management platforms — enabling a complete digital customer journey that maximizes engagement and drives higher revenue.",
    number_employees: 300,
    tech_team_size: 150,
    website_url: "https://www.elasticpath.com/",
    twitter: "@elasticpath",
    logo_url: "https://marketingmedia.ca/wp-content/themes/marketingmedia/images/ecommerce/logo-Elastic%20Path%20Commerce.png",
    manager: "Harry Chemko",
    published: true,
    tags: tags.shuffle.slice(0, rand(1..5))
)

Company.create(
    name: "Eventbase Technology",
    address: "1280 Homer St Vancouver BC",
    overview: "Eventbase is the leading mobile event technology platform for global brands. Half of the top 20 technology companies in the world trust Eventbase to power their event apps. Current customers include IBM, Cisco, Microsoft, SAP, Century 21, ESPN and TD Ameritrade. We also power official apps for many of the largest events on earth including SXSW, CES, Comic-Con, Sundance and three Olympic Games. ",
    number_employees: 700,
    tech_team_size: 250,
    website_url: "https://www.eventbase.com/",
    twitter: "@EventbaseTech",
    logo_url: "https://pbs.twimg.com/profile_images/575921947843801088/oo-P4ilv_400x400.png",
    manager: "Jeff Sinclair",
    published: true,
    tags: tags.shuffle.slice(0, rand(1..5))
)

Company.create(
    name: "Zillow",
    address: "1122 Mainland St Vancouver BC",
    overview: "Zillow Group houses a portfolio of the largest and most vibrant real estate and home-related brands on the web and mobile.
    The company’s brands focus on all stages of the home lifecycle: renting, buying, selling, financing and home improvement. Zillow Group is committed to empowering consumers with unparalleled data, inspiration and knowledge around homes, and connecting them with the right local professionals to help. In addition, Zillow Group develops a comprehensive suite of marketing software and technology solutions to help real estate, rental and mortgage professionals maximize business opportunities and connect with millions of consumers.",
    number_employees: 600,
    tech_team_size: 340,
    website_url: "https://www.zillowgroup.com/",
    twitter: "@ZillowGroup",
    logo_url: "https://blog.recolorado.com/wp-content/uploads/2017/05/ZillowHeader_Two.jpg",
    manager: "Spencer Rascoff",
    published: true,
    tags: tags.shuffle.slice(0, rand(1..5))
)

Company.create(
    name: "Aquatic Informatics Inc",
    address: "1111 W Georgia St Vancouver BC",
    overview: "Aquatic Informatics provides software solutions that address critical water data management, analytics, and compliance challenges for the rapidly growing water industry. Aquatic Informatics is the trusted provider of water management solutions to over 1,000 municipal, federal, state/provincial, hydropower, mining, academic, and consulting organizations around the world that collect, manage, and process large volumes of water data.",
    number_employees: 90,
    tech_team_size: 40,
    website_url: "https://aquaticinformatics.com/",
    twitter: "@AQUARIUSinfo",
    logo_url: "https://ecotoxcan.ca/media/Logo_AI_RGB.jpg",
    manager: "Edward Quilty",
    published: true,
    tags: tags.shuffle.slice(0, rand(1..5))
)

Company.create(
    name: "Allocadia",
    address: "1066 W Hastings St Vancouver BC",
    overview: "The Allocadia story begins with the entrepreneurial spirit and ambition of two identical twin sisters who shared a collective desire to create and innovate.
    While operating their first venture, a marketing services company, they witnessed their customers struggling with a familiar marketing pain – managing multi-million dollar budgets across multiple spreadsheets dispersed throughout the organization. Their customers lacked visibility into marketing spend, couldn’t answer basic questions about spend forecast or commit, or communicate the ROI on their marketing spend.",
    number_employees: 600,
    tech_team_size: 210,
    website_url: "https://www.allocadia.com/",
    twitter: "@allocadia",
    logo_url: "https://www.allocadia.com/wp-content/uploads/2016/06/Allocadia-Logo-RGB-500.png",
    manager: "Kristine Steuart",
    published: true,
    tags: tags.shuffle.slice(0, rand(1..5))
)

Company.create(
    name: "Dynamic Leap Technology Inc",
    address: "625 Howe Street Vancouver BC",
    overview: "Dynamic Leap has steadily grown to become one of Vancouver’s leading mobile development companies. Using beautiful design, deep technical expertise, and strategic insights earned over more years than we’d like to admit, we take a great deal of pride in delivering amazing mobile experiences for our clients. Whether it’s designing a system from the ground up, updating an existing application, or consulting on strategy and monetization, we provide the expert technical advice and insight needed to make each project a successful one.",
    number_employees: 50,
    tech_team_size: 30,
    website_url: "https://dynamic-leap.com/",
    twitter: "@dynamicleap",
    logo_url: "https://s3-us-west-2.amazonaws.com/techvibes/uploads/companies_imgs/21600.png",
    manager: "Andrei Iancu",
    published: true,
    tags: tags.shuffle.slice(0, rand(1..5))
)

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




companies = Company.all
puts Cowsay.say "Created #{companies.count} companies", :tux
puts "ADMIN Login with #{super_user.email} and password of '#{PASSWORD}'"

