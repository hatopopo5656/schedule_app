class Schedule < ApplicationRecord
    validates :title, length: { maximum: 20 }
    validates :memo, length: { maximum: 500 }
    validates :start_date, presence: true
    validates :end_date, presence: true

    validate :end_date_is_after_start_date
    private

    def end_date_is_after_start_date
        return if start_date.blank? || end_date.blank?

        if end_date < start_date
            errors.add(:end_date, "は開始日より後の日付にしてください")
        end
    end
end
