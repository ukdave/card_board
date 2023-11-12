class CardsController < ApplicationController
  def create
    card = Card.create!(create_params)
    redirect_to board_path(card.board)
  end

  def destroy
    card = Card.find(params[:id])
    card.destroy!
    redirect_to board_path(card.board)
  end

  private

  def create_params
    params.require(:card).permit(:title).merge(column_id: params[:column_id])
  end
end
