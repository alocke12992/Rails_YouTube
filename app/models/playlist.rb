class Playlist < ApplicationRecord
  belongs_to :account
  has_many :movies 
end
