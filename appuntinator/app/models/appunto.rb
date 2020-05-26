class Appunto < ApplicationRecord
    belongs_to :user
  
    has_many :comments, dependent: :delete_all

    validates :contenuto, :presence => true
    validates_inclusion_of :category, in: ["Arte", "Letteratura", "Scienza", "Tecnologia"]
end
