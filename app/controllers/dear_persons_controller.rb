class DearPersonsController < ApplicationController
  def new
    @dear_person = DearPerson.new  
  end

  def create
    @dear_person = DearPerson.new(dear_person_params)
    if @dear_person.valid?
      
      @dear_person.save  # バリデーションをクリアした時 
      redirect_to  dear_person_path(@dear_person.id) 
    else
      ender 'new' # バリデーションに弾かれた時
    end
  end

  private

  def dear_person_params
    params.require(:dear_person).permit(:image, :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday, :anniversary,).merge(user_id: current_user.id)
  end
end
