class DearPersonsController < ApplicationController
  def new
    @dear_person = DearPerson.new  
  end

  def create
    @dear_person = DearPerson.new(dear_person_params)
    binding.pry
    if @dear_person.valid?
      
      @dear_person.save  # バリデーションをクリアした時 
      redirect_to  dear_person_path(@dear_person.id) 
    else
      render 'new' # バリデーションに弾かれた時
    end
  end

  def show
    @dear_person = DearPerson.find(params[:id])
  end
  private

  def dear_person_params
    params.require(:dear_person).permit(:image, :nick_name, :family_name, :last_name, :family_name_kana, :last_name_kana, :birthday, :anniversary,).merge(user_id: current_user.id)
  end
end
