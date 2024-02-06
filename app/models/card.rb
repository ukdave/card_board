class Card < ApplicationRecord
  acts_as_list scope: :column

  belongs_to :column, touch: true

  validates :title, presence: true

  delegate :board, to: :column

  enum colour: {
    default: 0,
    blue: 1,
    purple: 2,
    pink: 3,
    red: 4,
    orange: 5,
    yellow: 6,
    green: 7,
    teal: 8,
    cyan: 9
  }, _prefix: true
end
