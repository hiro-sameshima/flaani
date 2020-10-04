class PlansController < ApplicationController
  before_action :dear_person_set, only: [:index, :create]
  def index
    @plan = Plan.new
  end

  def create
    @plan = PlanAddress.new(plan_params)
    if @plan.valid?
      pay_item
      @plan.save  # バリデーションをクリアした時
      redirect_to root_path
    else
      render 'index' # バリデーションに弾かれた時
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:price, :style).merge(dear_person_id: @dear_person.id )
    # params.require(:plan).permit(:price, :style).merge(dear_person_id: params[:tweet_id] )
  end

  def dear_person_set
    @dear_person = DearPerson.find(params[:dear_person_id])
 end

 def pay_item
  Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # PAY.JPテスト秘密鍵
  Payjp::Charge.create(
    amount: @item.price,  # 商品の値段
    card: params[:token],                      # カードトークン
    currency: 'jpy'                             # 通貨の種類(日本円)
  )
end
end
