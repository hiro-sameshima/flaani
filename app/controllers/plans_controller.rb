class PlansController < ApplicationController
  before_action :dear_person_set, only: [:index, :create]
  def index
    @plan = Plan.new
  end

  def create
    @plan = PlanAddress.new(plan_params)
    if @plan.valid?
      pay_item
      @plan.save # バリデーションをクリアした時
      redirect_to root_path
    else
      render 'index' # バリデーションに弾かれた時
    end
  end

  def edit
  end

  private

  def plan_params
    params.permit(:dear_person_id, :token, :price, :style, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :delivery_time_id).merge(user_id: current_user.id).merge(dear_person_id: @dear_person.id)
    rams.require(:plan).permit(:token, :price, :style, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :delivery_time_id).merge(dear_person_id: @dear_person.id)
  end

  def dear_person_set
    @dear_person = DearPerson.find(params[:dear_person_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @plan.price, # 商品の値段
      card: params[:token], # カードトークン
      currency: 'jpy'                             # 通貨の種類(日本円)
    )
  end
end
