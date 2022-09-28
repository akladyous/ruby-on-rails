# frozen_string_literal: true

class Url < ApplicationRecord
    has_many :clicks
    
    
    scope :latest, -> { current_month.order(:created_at).limit(10) }

    scope :current_month, -> { 
        start = Time.now
        where(created_at: start.beginning_of_month..start.end_of_month)
    }

    scope :daily_clicks, ->  (url_id) {
        current_month
        where(id: url_id)
        .joins(:clicks)
        .group("clicks.created_at::date")
        .count
        .transform_keys{ |key| key.strftime("%d")}
        .to_a
    }

    scope :browsers_clicks, -> (url_id) {
        current_month
        .where(id: url_id)
        .joins(:clicks)
        .group("clicks.browser")
        .count(:id)
        .to_a
    }

    scope :platform_clicks, -> (url_id) {
        current_month
        .where(id: url_id)
        .joins(:clicks)
        .group("clicks.platform")
        .count(:id)
        .to_a
    }
end
