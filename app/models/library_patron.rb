class LibraryPatron < ApplicationRecord
    has_many :borrow_histories
    has_many :books, through: :borrow_histories
    validates :firstname, presence: true, length: { minimum: 3 }
    validates :lastname, presence: true, length: { minimum: 3 }
    validates :email, presence: true, length: { minimum: 3 }
    validates :contact, presence: true, length: { minimum: 3 }
    validates :location, presence: true, length: { minimum: 3 }
    validates :address, presence: true, length: { minimum: 3 }
    validates :identity_card, presence: true, length: { minimum: 3 }
    validates :identity_no, presence: true, length: { minimum: 3 }
    validates :city, presence: true, length: { minimum: 3 }
    validates :state, presence: true, length: { minimum: 3 }
end