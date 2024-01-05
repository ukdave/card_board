class Card < ApplicationRecord
  acts_as_list scope: :column

  belongs_to :column

  validates :title, presence: true

  delegate :board, to: :column

  broadcasts_refreshes_to ->(card) { card.board }
end
