class CardsController < ApplicationController
  before_action :set_card, only: %i[update destroy]

  def create
    @card = Card.create!(create_params)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to board_path(@card.board) }
    end
  end

  def update
    @card.update!(update_params)
    head :no_content
  end

  def destroy
    @card.destroy!
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to board_path(@card.board) }
    end
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
