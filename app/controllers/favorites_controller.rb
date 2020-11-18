class FavoritesController < ApplicationController
  def new
    @favorite = Favorite.new
    @florists = Florist.all
  end

  def create
    @user = User.find(current_user[:id])
    @favorite = Favorite.new(favorite_params)
    if @favorite.valid?
      
      @favorite.save # バリデーションをクリアした時
      redirect_to  dear_person_path(@user)
    else
      render 'new' # バリデーションに弾かれた時
    end
  end
  private

  def favorite_params
    params.permit(:dear_person_id,:florist_id)
  end

end
