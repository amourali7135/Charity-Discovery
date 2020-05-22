class CharitiesController < ApplicationController
  def index
    @charities = Charity.all
  end

  def new
    @charity = Charity.new
  end

  def create
    @charity = Charity.new(charity_params)
    @charity.user_id = current_user.id
    if @charity.save
      flash[:notice] = "Your charity profile was successfully created!"
      redirect_to dashboard_path
    else
      flash[:notice] = "There was an error, please try again!"
      render "new"
    end
  end

  def show
    @charity = Charity.find(params[:id])
    @campaigns = @charity.campaigns
  end

  def update
    @charity = Charity.find(params[:id])
    if @charity.update(charity_params)
      flash[:notice] = "Your charity profile was successfully updated!"
      redirect_to dashboard_path
    else
      flash[:error] = "There was an error, please try again!"
      render 'edit'
    end
  end

  def delete
    @charity = Charity.find(params[:id])
    @charity.destroy
    flash[:notice] = "Your charity profile was successfully deleted!"
    redirect_to root_path
  end

  def edit
    @charity = Charity.find(params[:id])
  end

  private

  # def set_current_page
  # @current_page = params[:page]&.to_i || 1
  # end

  def charity_params #stop forgetting columns man!
    params.require(:charity).permit(:name, :aged, :instagram, :photo, :facebook, :website, :city, :country, :income, :country_focus, :size, :program_percentage, :cost_to_100, :fiveohone, :phone, :email, :mission, :goal, :age, :issues, tag_list: [],  )
  end
end
