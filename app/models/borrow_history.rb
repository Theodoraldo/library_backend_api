class BorrowHistory < ApplicationRecord
    enum book_state: { good: 0, bad: 1, torn: 2, lost: 3 }
    belongs_to :book
    belongs_to :library_patron
    validates :book_id, presence: true
    validates :library_patron_id, presence: true
    validates :borrow_date, presence: true
    validate :returned_date_cannot_be_in_the_past
  
    def returned_date_cannot_be_in_the_past
      if returned_date.present? && returned_date < borrow_date
        errors.add(:returned_date, "can't be in the past")
      end
    end
end