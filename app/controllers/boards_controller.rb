class BoardsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  def index
    @board = Board.new
    @boards = Board.all
  end

  def show
  end

  def edit
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to board_path(@board), notice: "Board was successfully created."
    else
      @boards = Board.all
      render_with_flash :index, status: :unprocessable_content, alert: "Failed to create board."
    end
  end

  def update
    if @board.update(board_params)
      redirect_to board_path(@board), notice: "Board was successfully updated."
    else
      render_with_flash :edit, status: :unprocessable_content, alert: "Failed to update board."
    end
  end

  def destroy
    @board.destroy!
    redirect_to boards_path, notice: "Board was successfully deleted."
  end

  private

  def set_project
    @board = Board.find(params.expect(:id))
  end

  def board_params
    params.expect(board: [:name])
  end
end
