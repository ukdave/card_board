class Card < ApplicationRecord
  acts_as_list scope: :column

  belongs_to :column

  validates :title, presence: true

  delegate :board, to: :column

  broadcasts_to ->(card) { card.board }, inserts_by: :append, target: ->(card) { [card.column, :cards] }
end
