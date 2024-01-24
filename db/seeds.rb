# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

Genre.create([
  { genre_name: 'Action', description: 'Exciting and fast-paced content with intense scenes and thrilling plot twists.' },
  { genre_name: 'Drama', description: 'Emotionally charged narratives focusing on interpersonal conflicts and character development.' },
  { genre_name: 'Comedy', description: 'Humorous and light-hearted content designed to entertain and make the audience laugh.' },
  { genre_name: 'Science Fiction', description: 'Speculative fiction exploring futuristic concepts, advanced technology, and otherworldly settings.' },
  { genre_name: 'Mystery', description: 'Intriguing and suspenseful stories often involving the solving of a crime or uncovering hidden secrets.' },
  { genre_name: 'Fantasy', description: 'Imaginative narratives set in fantastical worlds with magical elements and mythical creatures.' },
  { genre_name: 'Romance', description: 'Love stories centering around romantic relationships and the complexities of human emotions.' },
  { genre_name: 'Horror', description: 'Scary and suspenseful content aimed at evoking fear and unease in the audience.' },
  { genre_name: 'Documentary', description: 'Factual and informative content based on real events, people, and subjects.' },
  { genre_name: 'Adventure', description: 'Exciting and daring experiences in various settings.'},
  { genre_name: 'Thriller', description: 'Suspenseful and intense plots to keep the audience on the edge of their seats.'},
  { genre_name: 'Animation', description: 'Visual storytelling using animated characters and environments.'},
  { genre_name: 'Historical', description: 'Set in the past, exploring historical events, figures, and cultures.'},
  { genre_name: 'Western', description: 'Stories set in the American Old West, featuring cowboys and frontier life.'},
  { genre_name: 'Graphic Novels/Comics', description: 'Visual storytelling through a combination of images and text.'},
  { genre_name: 'Manga', description: 'Japanese comic books and graphic novels with a distinctive art style.'},
  { genre_name: 'Poetry', description: 'Expressive and rhythmic literary works often exploring emotions and experiences.'},
  { genre_name: 'Religious/Spiritual', description: 'Works centered around religious or spiritual themes and beliefs.'},
  { genre_name: 'Business/Finance', description: 'Content related to business, finance, and economic principles.'}
])

puts 'Seed data for genres have been created successfully!'


# Book.create(title: "The Gods are not to be blame", author: "Sani Achiba", pages: 120, available_copies: 20, published_date: "20/05/1990", genre: Genre.first)
# LibraryPatron.create(firstname: "Bertha", lastname: "Sussukpo", email: "berthasus@gmail.com", contact: "0245685478", location: "Avenor", address: "Stadium road str 1254", identity_card: "National insurance scheme", identity_no: "NIS-25412", city: "Accra", state: "Greater Accra")
# Attendance.create(check_in: "24/01/2024", check_out: "20/5/2021", library_patron: LibraryPatron.first)
# BorrowHistory.create([borrow_date: '2021-01-01', returned_date: '2021-01-02', book_state: 'good', book_id: 1, library_patron_id: 1])