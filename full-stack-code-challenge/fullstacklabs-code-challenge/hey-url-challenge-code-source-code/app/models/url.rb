# frozen_string_literal: true

class Url < ApplicationRecord
    has_many :clicks
    
    validates :original_url, presence: true
    validates :short_url, uniqueness: true, length: { 
        is: 5, 
        wrong_length: "short url length should be 5 characters long"
    }
    
    def self.short_url_exists?(url)
        exists?(short_url: url)
    end    

    scope :latest, -> { current_month.order(created_at: :asc).limit(10) }

    scope :daily_clicks, -> (url_id) {
        current_month
        .joins(:clicks)
        .group("clicks.created_at::date")
        .count
        .transform_keys{|key| key.strftime("%d")}
        .to_a
    }

    scope :current_month, -> {
        start = Time.zone.now
        where(created_at: start.beginning_of_month..start.end_of_month)
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
        where(id: url_id)
        .joins(:clicks)
        .group("clicks.platform")
        .count(:id)
        .to_a
    }
end