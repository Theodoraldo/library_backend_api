class Genre < ApplicationRecord
    has_many :books
    validates :genre_name, presence: true, length: { minimum: 3 }
    validates :description, presence: true, length: { minimum: 3 }
end
