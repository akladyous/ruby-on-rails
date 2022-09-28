providers = ["chrome", "firefox", "ie", "opera","safari"]
platforms = ["macOS","windows xp","linux","windows10","windows_ 11"]

def random_date
    rand(Time.now.beginning_of_month..Time.now.end_of_month).to_date
end

5.times do
    Url.create! do |url|
        url.clicks_count = rand(20)
        url.original_url = "https://www.google.com/#{(0..9).map { |el| (65 + rand(25)).chr}.join}"
        url.short_url = (0..4).map { |el| (65 + rand(25)).chr}.join
        url.update_attribute :created_at, random_date
        10.times do
            url.clicks.create! do |click|
                click.browser = providers.sample
                click.platform = platforms.sample
                click.update_attribute :created_at, random_date
            end
        end
    end
end

# Click.all.each do |click|
# 2.7.3 :042 >   click.update_attribute(:created_at, rand(Time.now.beginning_of_month..Time.now.end_of_month).to_date)
# 2.7.3 :043 > end

