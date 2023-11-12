class ColumnsController < ApplicationController
  def create
    column = Column.create!(create_params)
    redirect_to board_path(column.board)
  end

  def destroy
    column = Column.find(params[:id])
    column.destroy!
    redirect_to board_path(column.board)
  end

  private

  def create_params
    params.require(:column).permit(:name).merge(board_id: params[:board_id])
  end
end
