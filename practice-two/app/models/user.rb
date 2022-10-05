class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
    
    attr_accessor :friends_count
    has_many :profiles, dependent: :destroy
    has_many :friends
    has_many :supervisors

    has_and_belongs_to_many :mailing_lists


    belongs_to :padre, class_name: 'User', optional: true
    has_many   :figli, class_name: 'User', foreign_key: 'padre_id'

    scope :all_parents, -> {where(padre: nil)}
    scope :all_children, -> {where.not(padre: nil)}


    # default_scope {active}
    # default_scope { order('first_name ASC') }
    scope :active, -> { where(status: true)}
    # scope :inactive, -> { unscope(where: :status) }
    scope :inactive, -> { where(status: false) }

    def full_name
        "#{self.first_name} #{self.last_name}"
    end

end
