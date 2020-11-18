class BouquetsController < ApplicationController
  def new
    @bouquet = Bouquet.new
  end

  def create
    @bouquet = Bouquet.new(bouquet_params)
    if @bouquet.valid?
       @bouquet.save
       redirect_to  florist_path(current_florist[:id])
    else
        render 'new'
    end
  end

  def show
    @bouquet = Bouquet.find(params[:id])
    @florist = Florist.find(current_florist[:id])
  end

  private

  def bouquet_params
    params.require(:bouquet).permit(:image, :style, :commentary,).merge(florist_id: current_florist.id)
  end
end
