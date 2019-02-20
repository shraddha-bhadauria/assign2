class BookingsController < ApplicationController
  def index
    @bookings=Booking.all
  end

  def new
    @bookings= Booking.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bookings }
    end
  end

  def create
    @bookings = Booking.new(booking_params)
    # @cars = Car.all
    respond_to do |format|
      if @bookings.save
        # log_in @bookings
        flash[:success] = "Welcome to the Tour management system!"
        format.html { redirect_to :controller => 'welcome', :action => 'index', notice: 'Booking was successfully created.' }
        format.json { render json: @bookings, status: :created, location: 'welcome/index' }
      else
        flash.now[:notice] = "Invalid email/password combination"
        format.html { render action: "new" }
        format.json { render json: @bookings.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @bookings = Booking.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bookings }
    end
  end

  def edit
    @bookings = Booking.find(params[:id])
  end

  def update
    @bookings = Booking.find(params[:id])

    respond_to do |format|
      if @bookings.update_attributes(booking_params)
        format.html { redirect_to @bookings, notice: 'Booking was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bookings.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bookings.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url }
      format.json { head :no_content }
    end
  end

  def booking_params
    params.require(:booking).permit(:customer_id, :tour_id, :bseats, :bwait_list)
  end
end
