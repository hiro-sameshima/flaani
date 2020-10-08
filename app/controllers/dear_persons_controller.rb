class DearPersonsController < ApplicationController
  before_action :authenticate_user!,  except: [:index, :show]
  def index
    @dear_persons = DearPerson.all
    @user = User.find(current_user[:id])
    @plans = Plan.all
    # @plan = Plan.find(current_user[:id])
    # binding.pry
  end

  def new
    @dear_person = DearPerson.new
  end

  def create
    @dear_person = DearPerson.new(dear_person_params)
    if @dear_person.valid?

      @dear_person.save # バリデーションをクリアした時
      redirect_to  dear_person_path(@dear_person)
    else
      render 'new' # バリデーションに弾かれた時
    end
  end

  def show
    @dear_person = DearPerson.find(params[:id])
    @plans = Plan.all
  end

  def edit
    @dear_person = DearPerson.find(params[:id])
  end

  def update
    @dear_person = DearPerson.find(params[:id])
    if @dear_person.update(dear_person_params)
      redirect_to root_path
    else
      render 'edit' # バリデーションに弾かれた時
    end
  end

  def destroy
    dear_person = DearPerson.find(params[:id])
    dear_person.destroy
    redirect_to root_path
  end

  private

  def dear_person_params
    params.require(:dear_person).permit(:image, :nick_name, :family_name, :last_name, :family_name_kana, :last_name_kana, :birthday, :anniversary).merge(user_id: current_user.id)
  end
end
