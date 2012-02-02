class LoyaltiesController < ApplicationController
  # GET /loyalties
  # GET /loyalties.json
  def index
    @loyalties = Loyalty.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @loyalties }
    end
  end

  # GET /loyalties/1
  # GET /loyalties/1.json
  def show
    @loyalty = Loyalty.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @loyalty }
    end
  end

  # GET /loyalties/new
  # GET /loyalties/new.json
  def new
    @loyalty = Loyalty.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @loyalty }
    end
  end

  # GET /loyalties/1/edit
  def edit
    @loyalty = Loyalty.find(params[:id])
  end

  # POST /loyalties
  # POST /loyalties.json
  def create
    @shop = Shop.find(current_owner.id)
    @user = User.find_for_authentication(:email => params[:loyalty][:name])
    @loyalty = @shop.loyalties.create({:profile_id => @user.id, :points => params[:loyalty][:points]})
    redirect_to shop_path(@shop)
  end
  
  # PUT /loyalties/1
  # PUT /loyalties/1.json
  def update
    @loyalty = Loyalty.find(params[:id])

    respond_to do |format|
      if @loyalty.update_attributes(params[:loyalty])
        format.html { redirect_to @loyalty, notice: 'Loyalty was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @loyalty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loyalties/1
  # DELETE /loyalties/1.json
  def destroy
    @loyalty = Loyalty.find(params[:id])
    @loyalty.destroy

    respond_to do |format|
      format.html { redirect_to loyalties_url }
      format.json { head :no_content }
    end
  end
end
