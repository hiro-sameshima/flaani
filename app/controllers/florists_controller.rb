class FloristsController < ApplicationController
  def show
    # @florists = Florist.all
    # @florist = Florist.find(params[:id])
    @florist = current_florist
    @plans = Plan.all
    @addresses = Address.all
  end
end
