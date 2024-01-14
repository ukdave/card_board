class Board < ApplicationRecord
  has_many :columns, -> { order(position: :asc) }, inverse_of: :board, dependent: :destroy

  validates :name, presence: true

  broadcasts_refreshes
end
