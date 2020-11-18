class FloristsController < ApplicationController
  def show

    @shop_addresses = ShopAddress.all
    @florist = Florist.find(params[:id])
    @plans = Plan.all
    @addresses = Address.all
    @plan_address_person = []
    @persons = DearPerson.all
    @persons.each do |person|
      unless person.plan.nil? # 決済されたdear_personを@plan_address_personに格納
        @plan_address_person.push(person)
      end
    end
    @favorite = []
    @favorites = Favorite.all
    @favorites.each do |favorite|
      if favorite.florist_id == @florist.id #ログインしているfoloristとお気に入りに登録されたflorist_idが一致したdear_personを＠favorite配列に格納
        @favorite.push(favorite)        
      end  
    end
    @get_plan_favorite = []
    if  @favorite.length >= @plan_address_person.length
      @favorite.each do |favo|
        @plan_address_person.each do |pap|
          if favo[:dear_person_id]  == pap[:id]
            @get_plan_favorite.push(pap)
          else
            #入れない
          end
        end
      end
    else
      @plan_address_person.each do |pap|
        @favorite.each do |favo|
          if favo[:dear_person_id]  == pap[:id]
            @get_plan_favorite.push(pap)
          else
            #入れない
          end
        end
      end
    end
    
  end


  
  def edit
    
  end
end
