class BoardsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  def index
    @boards = Board.all
  end

  def show
  end

  def edit
  end

  def create
    @board = Board.create!(board_params)
    redirect_to board_path(@board), notice: "Board was successfully created."
  end

  def update
    if @board.update(board_params)
      redirect_to board_path(@board), notice: "Board was successfully updated."
    else
      render_with_flash :edit, status: :unprocessable_entity, alert: "Failed to update board."
    end
  end

  def destroy
    @board.destroy!
    redirect_to boards_path, notice: "Board was successfully deleted."
  end

  private

  def set_project
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:name)
  end
end
