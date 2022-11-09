class Info < ApplicationRecord
  has_and_belongs_to_many :peoples
  belongs_to :user, optional: true
  before_create :generate_token

  validates :name, text: true

  private

    def generate_token
      loop do
        self.token = SecureRandom.hex
        break unless self.class.exists?(token: token)
      end
    end
end
# SELECT COUNT(users.id) AS users_count, infos.name FROM infos LEFT OUTER JOIN "users" ON users.id = infos.user_id GROUP BY infos.name;
# select count(users.id) as user_count, infos.name from infos left outer join users on users.id = infos.id group by infos.name;

# Info.left_outer_joins(:user).group(:name).count("users.id")
