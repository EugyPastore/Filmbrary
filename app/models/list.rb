class List < ApplicationRecord
has_many :bookmarks
validates :name, uniqness: true

end
