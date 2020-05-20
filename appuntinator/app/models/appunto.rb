class Appunto < ApplicationRecord
    has_many :comments

    validates :contenuto, :presence => true
end
