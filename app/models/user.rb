class User < ActiveRecord::Base
    has_many :tickets
    has_many :recods
    has_many :reports
end
