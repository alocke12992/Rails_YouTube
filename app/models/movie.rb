class Movie < ApplicationRecord
  has_many :comments
  belongs_to :playlist
end
