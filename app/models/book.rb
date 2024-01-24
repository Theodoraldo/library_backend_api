class Book < ApplicationRecord
    validates :title, presence: true
    validates :author, presence: true
    validates :pages, presence: true
    validates :available_copies, presence: true
    validates :published_date, presence: true
    validates :genre_id, presence: true
    
    belongs_to :genre
end
