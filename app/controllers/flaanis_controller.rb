class FlaanisController < ApplicationController
  def index
    @florists = Florist.all
  end
end
