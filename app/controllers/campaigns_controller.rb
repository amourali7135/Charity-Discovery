class CampaignsController < ApplicationController
  def index
    @charity = Charity.find(params[:charity_id])
    @campaigns = Campaign.all
  end

  def new
    @charity = Charity.find(params[:charity_id])
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    # @campaign.user_id = @buyer.user_id
    @charity = Charity.find(params[:charity_id])
    @campaign.charity = @charity
    if @campaign.save
      flash[:notice] = "Your campaign was successfully created!"
      redirect_to dashboard_path
    else
      flash[:notice] = "There was an error, please try again!"
      render "new"
    end
  end

  def show
    @campaign = Campaign.find(params[:id])
    @charity = @campaign.charity
  end

  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update(campaign_params)
      # flash[:notice] = "Your campaign was successfully updated!"
      flash[:success] = "Your campaign was successfully updated!"
      redirect_to dashboard_path
    else
      flash[:error] = "There was an error, please try again!"
      render 'edit'
    end
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
    flash[:notice] = "Your campaign was successfully deleted!"
    redirect_to dashboard_path
  end

  def edit
    @charity = Charity.find(params[:charity_id])
    @campaign = Campaign.find(params[:id])
  end

  private

  # def set_current_page
  # @current_page = params[:page]&.to_i || 1
  # end

  def campaign_params #stop forgetting columns man!
    params.require(:campaign).permit(:title, :goal, :completion_date, :fundraising_goal, :how, :end_date, :photo, :amount_raised, tag_list: [],  )
  end


end
