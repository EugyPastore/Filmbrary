class Movie < ApplicationRecord
	has_many :bookmarks
	validates :title, presence: true, uniqness: true
	validates :overview, presence: true

end
