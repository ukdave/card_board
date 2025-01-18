class ColumnsController < ApplicationController
  before_action :set_column, only: %i[update destroy]

  def create
    @column = Column.create!(create_params)
    redirect_to board_path(@column.board)
  end

  def update
    @column.update!(update_params)
    redirect_to board_path(@column.board)
  end

  def destroy
    @column.destroy!
    redirect_to board_path(@column.board)
  end

  private

  def set_column
    @column = Column.find(params.expect(:id))
  end

  def create_params
    params.expect(column: [:name]).merge(board_id: params.expect(:board_id))
  end

  def update_params
    params.expect(column: [:position])
  end
end
