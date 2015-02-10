User.find_or_create_by(email: 'john@doe.net') do |user|
  user.first_name = "john"
  user.last_name  = "doe"
  user.password = "doe123123"
end
Category.create!([
                     {title: "Learning Rails"},
                     {title: "Uncategorized"},
                     {title: "Fantasy"},
                     {title: "History"},
                     {title: "Humor"}
                 ])
OrderStatus.create!([
                        {name: "In Progress"},
                        {name: "In queue"},
                        {name: "In delivery"},
                        {name: "Delivered"},
                        {name: "Cancelled"}
                    ])
Role.create!([
                 {name: "customer"},
                 {name: "banned"},
                 {name: "moderator"},
                 {name: "admin"}
             ])
Author.create!([
  {first_name: "Kevin", last_name: "Faustino", biography: "Kevin is founder and chief craftsman of Remarkable Labs, based in Toronto, Canada. He believes that software should not just work but be well crafted. He founded Remarkable Labs because he wanted to build a company that he would be proud to work for and that other companies would love to work with."},
  {first_name: "john", last_name: "doe", biography: nil},
  {first_name: "Daniel", last_name: "Kehoe", biography: ""},
  {first_name: "Michael", last_name: "Hartl", biography: ""},
  {first_name: "George", last_name: "Orwell", biography: "GEORGE ORWELL (1903-1950) was born in India and served with the Imperial Police in Burma before joining the Republican Army in the Spanish Civil War. Orwell was the author of six novels as well as numerous essays and nonfiction works."},
  {first_name: "George", last_name: "Friedman ", biography: ""},
  {first_name: "Keegan", last_name: "Allen", biography: ""}
])
Book.create!([
  {title: "The Rails 4 Way", description: "The Rails™ 4 Way is the only comprehensive, authoritative guide to delivering production-quality code with Rails 4. Kevin Faustino joins pioneering Rails developer Obie Fernandez to illuminate the entire Rails 4 API, including its most powerful and modern idioms, design approaches, and libraries. They present extensive new and updated content on security, performance, caching, Haml, RSpec, Ajax, the Asset Pipeline, and more.",
   price: 33.67, stock: 10, category_id: 1, author_id: 1, image: "51X4nf0-thL.jpg"},
  {title: "Learn Ruby on Rails", description: "Get this book by renowned teacher and author Daniel Kehoe. No other tutorial does a better job of explaining the concepts. Master the basics. Learn the practices you'll use in the workplace as a professional Rails developer. Learn in a weekend, building a real-life web application, using the newest Rails version.",
   price: 11.99, stock: 10, category_id: 1, author_id: 3, image: "61P2zxIgMRL._SL1001_.jpg"},
  {title: "Ruby on Rails Tutorial", description: "Learn Web Development with Rails (2nd Edition) (Addison-Wesley Professional Ruby Series) by Hartl, Michael (2012) Paperback",
   price: 394.0, stock: 10, category_id: 1, author_id: 4, image: "51Q9AhUhhEL.jpg"},
  {title: "1984 and Animal Farm", description: "1984 AND ANIMAL FARM GEORGE ORWELL 1984: 1984 is a popular novel authored by British writer George Orwell and published in year 1949. The story of 1984 is set in an imaginary place called Airstrip One. This Airstrip One is actually the Britain. The system of governance in this territory is one oligarchy by inert elites of dictator government. This kind of social-scientific socialism is known by the name of Ingsoc in a language invented and patronized by the totalitarianist government. However, this new invented language is pretty much off the regular or popular one's still its name sounds logically right being simply called newspeak. Airstrip One which is a territory of greater state of Oceania offers similar living conditions (personal and Social) to the one offered by the greater Oceania or rest of the world. Personal thinking has been made a crime and omnipresent government surveillance, thought manipulation, and perpetual war are common traits found in a territory. ANIMAL FARM: A highly claimed novel penned by George Orwell that largely focuses on the Russian revolution and the consequences followed thereafter. Animal Farm's success can be understood by the facts that the book has been placed at the highest spots once and again throughout the later 20th century and also in the early 21st.",
   price: 7.62, stock: 10, category_id: 3, author_id: 5, image: "51MP5j0SRBL.jpg"},
  {title: "Flashpoints: The Emerging Crisis in Europe", description: "A major new book by New York Times bestselling author and geopolitical forecaster George Friedman (The Next 100 Years), with a bold thesis about coming events in Europe. This provocative work examines “flashpoints,” unique geopolitical hot spots where tensions have erupted throughout history, and where conflict is due to emerge again.",
   price: 21.11, stock: 10, category_id: 4, author_id: 6, image: "51DN1xRo-EL.jpg"},
  {title: "life.love.beauty", description: "“This book takes you on a photographic voyage through my life so far.” –Keegan Allen\r\n\r\nKeegan Allen is currently known to fans of the ABC Family hit television series, Pretty Little Liars. He has also appeared in numerous independent films and made his New York Stage debut in the acclaimed MCC production of Small Engine Repair.\r\nKeegan was given his first camera at age nine, and began a lifelong study and pursuit of photography.  life.love.beauty is a selection of photographs taken since his childhood. ",
   price: 20.99, stock: 10, category_id: 5, author_id: 7, image: "91k4C85X61L.jpg"}
])

