class BorrowHistory < ApplicationRecord
    enum book_state: { "0": "good", "1": "bad", "2": "torn", "3": "lost" }
    belongs_to :book
    belongs_to :library_patron
    validates :book_id, presence: true
    validates :library_patron_id, presence: true
    validates :borrow_date, presence: true

    validate :check_book_quantity, on: :create
    validate :borrow_date_cannot_be_in_the_past, on: :create
    validate :returned_date_cannot_be_in_the_past, on: :update

    after_create :decrease_book_quantity_on_create
    after_update :increase_book_quantity_on_update
    before_update :returned_date_cannot_be_in_the_past
    before_create :borrow_date_cannot_be_in_the_past

    private

    def check_book_quantity
      if book.available_copies <= 0
        errors.add(:base, 'Cannot issue this book because quantity is already zero')
      end
    end
  
    def decrease_book_quantity_on_create
      book.update(available_copies: book.available_copies - 1) if book.available_copies > 0
    end
  
    def increase_book_quantity_on_update
      book.update(available_copies: book.available_copies + 1)
    end
  
    def returned_date_cannot_be_in_the_past
      if returned_date.present? && returned_date < borrow_date
        errors.add(:returned_date, "Return date can't be in the past")
      end
    end

    def borrow_date_cannot_be_in_the_past
      if borrow_date.present? && borrow_date < Date.today
        errors.add(:borrow_date, "Borrow date of book can't be in the past")
      end
    end
end

