class ColumnsController < ApplicationController
  before_action :set_column, only: %i[update destroy]

  def create
    column = Column.create!(create_params)
    redirect_to board_path(column.board)
  end

  def update
    @column.update!(update_params)
    head :no_content
  end

  def destroy
    @column.destroy!
    redirect_to board_path(@column.board)
  end

  private

  def set_column
    @column = Column.find(params[:id])
  end

  def create_params
    params.require(:column).permit(:name).merge(board_id: params[:board_id])
  end

  def update_params
    params.require(:column).permit(:position)
  end
end
