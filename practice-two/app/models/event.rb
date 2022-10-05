class Event < ApplicationRecord
    scope :current_month, ->{
        start = Time.zone.now
        where(clocked_in: start.beginning_of_month..start.end_of_month)
    }

    scope :current_week, ->{
        where(clocked_in: Time.zone.now.beginning_of_week..Time.zone.now.end_of_month)
    }

    scope :payroll_week, ->{
        start_date = Time.zone.now.beginning_of_week
        end_date = Time.zone.now.end_of_week + 7.days
        where(clocked_in: start_date..end_date)
    }

    scope :bussiness_days, ->{
        where("EXTRACT(DOW FROM clocked_in) in (?)", 1..5)
    }

end
