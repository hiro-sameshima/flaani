class FlaanisController < ApplicationController
  def index
    @florists = Florist.all
    @bouquets = Bouquet.all
  end
end
