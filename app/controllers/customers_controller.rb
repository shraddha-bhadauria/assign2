class CustomersController < ApplicationController
  def index
    @customers=Customer.all
  end

  def new
    @customers= Customer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @customers }
    end
  end

  def create
    @customers = Customer.new(customer_params)
    # @cars = Car.all
    respond_to do |format|
      if @customers.save
        # log_in @customers
        flash[:success] = "Welcome to the Tour management system!"
        format.html { redirect_to :controller => 'welcome', :action => 'index', notice: 'Customer was successfully created.' }
        format.json { render json: @customers, status: :created, location: 'welcome/index' }
      else
        format.html { render action: "new" }
        format.json { render json: @customers.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @customers = Customer.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @customers }
    end
  end

  def edit
    @customers = Customer.find(params[:id])
  end

  def update
    @customers = Customer.find(params[:id])

    respond_to do |format|
      if @customers.update_attributes(customer_params)
        format.html { redirect_to @customers, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @customers.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  def customer_params
    params.require(:customer).permit(:name, :email, :password)
  end
end
