class Appunto < ApplicationRecord
    belongs_to :user
    has_many :comments

    validates :contenuto, :presence => true
end
