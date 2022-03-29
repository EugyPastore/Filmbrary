class Movie < ApplicationRecord
	has_many :bookmarks, dependent: :deny
	validates :title, presence: true, uniqness: true
	validates :overview, presence: true

end
