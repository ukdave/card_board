class Card < ApplicationRecord
  acts_as_list scope: :column

  belongs_to :column, touch: true

  validates :title, presence: true

  delegate :board, to: :column
end
