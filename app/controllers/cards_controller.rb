class CardsController < ApplicationController
  before_action :set_card, only: %i[update destroy]

  def create
    @card = Card.create!(create_params)
    redirect_to board_path(@card.board)
  end

  def update
    @card.update!(update_params)
    redirect_to board_path(@card.board)
  end

  def destroy
    @card.destroy!
    redirect_to board_path(@card.board)
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def create_params
    params.require(:card).permit(:title).merge(column_id: params[:column_id])
  end

  def update_params
    params.require(:card).permit(:position, :column_id)
  end
end
