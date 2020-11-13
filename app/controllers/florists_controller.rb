class FloristsController < ApplicationController
  def show
    @shop_addresses = ShopAddress.all
    @florist = Florist.find(params[:id])
    @plans = Plan.all
    @addresses = Address.all
    @plan_address_person = []
    @persons = DearPerson.all
    @persons.each do |person|
      unless person.plan.nil?
        @plan_address_person.push(person)
      end
    end
  end

  def edit
    
  end
end
