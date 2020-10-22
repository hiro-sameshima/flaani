class FloristsController < ApplicationController
  def show
    @florist = current_florist
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
end
