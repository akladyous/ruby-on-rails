# frozen_string_literal: true

class Url < ApplicationRecord
    has_many :clicks


    validates :original_url, presence: true
    validates :short_url, uniqueness: true, length: {is: 5, wrong_length: "slug length should be %{count} characters long"}

    # scope :short_url_exists?, -> (short_url) {exists?(short_url: short_url)}
    # scope :short_url_exists?, -> (url) { where(short_url: url).any? }

    def self.short_url_exists?(url)
        exists?(short_url: url)
    end

    scope :browsers_by_clicks, -> (url_id) {
        where(id: url_id)
        .joins(:clicks)
        .group("clicks.browser")
        .count(:id).to_a
        # joins(:clicks).group("clicks.browser").count(:id).to_a 
    }

    scope :platforms_by_clicks, -> (url_id) {
        where(id: url_id)
        .joins(:clicks)
        .group("clicks.platform")
        .count(:id).to_a
    }

    scope :daily_clicks, -> {  
        order(created_at: :asc)
        .limit(10)
        .group(:created_at)
        .sum(:clicks_count)
        .values
        .each_with_index.inject([]) { |acc, (el, idx)| acc << [idx, el] }
    }

    scope :latest, -> { order(created_at: :asc).limit(10) }
end
