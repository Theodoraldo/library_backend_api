class Attendance < ApplicationRecord
    belongs_to :library_patron
    validates :check_in, presence: true
    validates :library_patron_id, presence: true
    validate :check_out_cannot_be_in_the_past
  
    def check_out_cannot_be_in_the_past
      if check_out.present? && check_out < check_in
        errors.add(:check_out, "can't be in the past")
      end
    end
end