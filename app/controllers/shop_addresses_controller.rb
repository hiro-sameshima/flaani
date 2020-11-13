class ShopAddressesController < ApplicationController
  def new
    @shop_address = ShopAddress.new
  end

  def create
    @shop_address = ShopAddress.new(shop_address_params)
    if @shop_address.valid?
       @shop_address.save
       redirect_to  florists_path(@shop_address)
    else
        render 'new'
    end
  end

  def edit
    @shop_address = ShopAddress.find(current_florist[:id])
  end

  def update
    @shop_address = ShopAddress.find(current_florist[:id])
      if @shop_address.update(shop_address_params)
        redirect_to root_path
      else
        render 'edit' # バリデーションに弾かれた時
    end
  
  end

  def show
    @shop_address = ShopAddress.find(params[:shop_address_id])
  end

  private

  def shop_address_params
    params.require(:shop_address).permit(:image, :shop_name, :email, :postal_code,:prefecture_id , :city, :house_number,:building_name, :phone_number).merge(florist_id: current_florist.id)
  end
end
