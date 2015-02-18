# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

url = "http://api.nytimes.com/svc/books/v2/lists/combined-print-and-e-book-fiction.json?api-key=#{Figaro.env.nyt_api_key}"

response = HTTParty.get(url)
list = response['results']
list.map!{|book| book['book_details'][0]}

list.each_with_index do |book, i|
  book_attrs = {
    title: book['title'].split.map(&:capitalize).join(' '),
    author: book['author'],
    one_liner: book['description'],
    cover_url: book['book_image'],
    summary: Faker::Lorem.paragraph(3)
  }
  Book.create(book_attrs)
  puts "#{i+1}. Created #{book_attrs[:title]}."
end
