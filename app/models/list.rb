class List < ApplicationRecord
has_many :bookmarks, dependent: :destroy
validates :name, uniqueness: true
has_many :movies, through: :bookmarks
end
