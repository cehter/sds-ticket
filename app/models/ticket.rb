class Ticket < ActiveRecord::Base
    belongs_to :user
    has_many :recods
end
