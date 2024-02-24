class Attendance < ApplicationRecord
    belongs_to :library_patron
    validates :check_in, presence: true
    validates :library_patron_id, presence: true
    validate :check_out_cannot_be_in_the_past, on: :update
    validate :check_patron_engagement, on: :create

    before_update :check_out_cannot_be_in_the_past
    after_update :engage_patron
    after_create :engage_patron
    before_create :check_patron_engagement
  
    private

    def check_patron_engagement
      if library_patron.engagement === true
        errors.add(:check_engagement, 'Person has already checked-in and engaged. Has to be checkout or disengaged first.')
      end
    end

    def engage_patron
      library_patron.update(engagement: !library_patron.engagement)
    end

    def check_out_cannot_be_in_the_past
      if check_out.present? && check_out < check_in
        errors.add(:check_out, "Check out date can't be in the past")
      end
    end
end