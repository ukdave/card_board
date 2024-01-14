class Column < ApplicationRecord
  acts_as_list scope: :board

  belongs_to :board, touch: true
  has_many :cards, -> { order(position: :asc) }, inverse_of: :column, dependent: :destroy

  validates :name, presence: true
end
