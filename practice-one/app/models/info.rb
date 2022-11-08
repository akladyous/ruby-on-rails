class Info < ApplicationRecord
  has_and_belongs_to_many :peoples
  belongs_to :user, optional: true
  before_create :generate_token

  validates :name, text: true

  private

    def generate_token
      loop do
        break unless self.class.exists?(token: token)
        self.token = SecureRandom.hex
      end
    end
end
