class Column < ApplicationRecord
  acts_as_list scope: :board

  belongs_to :board
  has_many :cards, -> { order(position: :asc) }, inverse_of: :column, dependent: :destroy

  validates :name, presence: true

  broadcasts_refreshes_to ->(column) { column.board }
end
