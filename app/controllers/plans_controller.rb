class PlansController < ApplicationController
  before_action :dear_person_set, only: [:index, :create]
  def index
    @plan = Plan.new
  end

  def create
    @plan = PlanAddress.create(plan_params)
    if @plan.valid?
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
end
