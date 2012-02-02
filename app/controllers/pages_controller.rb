class PagesController < ApplicationController
  
  def home
    if user_signed_in?
      @user = current_user
      @profile = Profile.find(@user.id)
      @loyalties = @profile.loyalties
    end
    if owner_signed_in?
      @owner = current_owner
      @shop = Shop.find(@owner.id)
      @loyalties = @shop.loyalties
      
      @loyalty = Loyalty.new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @loyalty }
      end
      
    end
  end

  def contact
  end
end
