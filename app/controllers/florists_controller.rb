class FloristsController < ApplicationController
  def show
    @persons = DearPerson.all
    @florist = current_florist
    @plans = Plan.all
    @addresses = Address.all
    binding.pry
  end
end
