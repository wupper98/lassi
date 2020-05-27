class Comment < ActiveRecord::Base
    belongs_to :appunto
    belongs_to :user

    validates :rating, :presence => true
end