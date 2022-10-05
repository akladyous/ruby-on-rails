class Utenti < ApplicationRecord

    belongs_to :manager,        class_name: "Utenti", optional: true
    has_many   :subordinates,   class_name: "Utenti", foreign_key: "manager_id"

    scope :managers, -> { where(manager_id: nil) }

end
