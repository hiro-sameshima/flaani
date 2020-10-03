class PlansController < ApplicationController
  def index
    @plan = Plan.new
  end

  def create
      @plan = Plan.create(plan_params)
  end

  private

  def plan_params
    params.require(:plan).permit(:price, :style).merge(dear_person_id: @dear_person.id )
  end

end
