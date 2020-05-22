class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard #Do I need to add @arts?  Or is it included already?
    @user = current_user
    @charity = Charity.find_by(user_id: @user.id)
    if !@user.charity
      flash[:notice] = "Only users with charity profiles have dashboards!"
      redirect_to root_path
    end
  end


end
