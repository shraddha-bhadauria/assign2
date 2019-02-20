class ToursController < ApplicationController
  def index
    @tours=Tour.all
  end

  def new
    @tours= Tour.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tours }
    end
  end

  def create
    @tours = Tour.new(tour_params)
    # @cars = Car.all
    respond_to do |format|
      if @tours.save
        # log_in @tours
        flash[:success] = "Welcome to the Tour management system!"
        format.html { redirect_to :controller => 'welcome', :action => 'index', notice: 'Tour was successfully created.' }
        format.json { render json: @tours, status: :created, location: 'welcome/index' }
      else
        flash.now[:notice] = "Invalid email/password combination"
        format.html { render action: "new" }
        format.json { render json: @tours.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @tours = Tour.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tours }
    end
  end

  def edit
    @tours = Tour.find(params[:id])
  end

  def update
    @tours = Tour.find(params[:id])

    respond_to do |format|
      if @tours.update_attributes(tour_params)
        format.html { redirect_to @tours, notice: 'Tour was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tours.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tours.destroy
    respond_to do |format|
      format.html { redirect_to tours_url }
      format.json { head :no_content }
    end
  end

  def tour_params
    params.require(:tour).permit(:customer_id, :tour_id, :bseats, :bwait_list)
  end
end
