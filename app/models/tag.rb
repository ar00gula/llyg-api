class Tag < ApplicationRecord
    belongs_to :umbrella_tag
    has_many :book_tags
    has_many :books, through: :book_tags
end
