# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  
  def new
    super 
  end

  def create
    super
  end

  def update
    super
  end
   
  def after_sign_up_path_for(resource)
    if resource.class == User
      edit_profile_path(resource)
    else
      edit_shop_path(resource)
    end
  end  
end 