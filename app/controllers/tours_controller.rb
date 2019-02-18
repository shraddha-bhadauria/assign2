class Tours < ApplicationController

  def index
    @tours = Tours.all
  end


  # GET /tours/new
  def new
    if current_user.id == nil
      redirect_to user_edit_path(current_user.id), :flash => { :error => "Cannot List a new tour " }
      return
    end
    @tours = Tours.new
  end

  def create_tour
    @tours = Tours.new(tour_params)
    @tours.id = current_user.id
    respond_to do |format|
      if @tours.save
        format.html { redirect_to @tours, notice: 'Tour was successfully created.' }
        format.json { render :show, status: :created, location: @tours }
      else
        format.html { render :new }
        format.json { render json: @tours.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @tours.update(tour_params)
        format.html { redirect_to @tours, notice: 'Tour was successfully updated.' }
        format.json { render :show, status: :ok, location: @tours }
      else
        format.html { render :edit }
        format.json { render json: @tours.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @tours.destroy
    respond_to do |format|
      format.html { redirect_to tours_url, notice: 'Tour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  INTEGER_MAX = 2147483647
  SIZE_MAPPING = {
      1 => [0, 500],
      2 => [500, 1500],
      3 => [1500, 3000],
      4 => [3000, INTEGER_MAX]
  }
  PRICE_MAPPING = {
      1 => [0, 100000],
      2 => [100000, 250000],
      3 => [250000, 500000],
      4 => [500000, 1000000],
      5 => [1000000, INTEGER_MAX]
  }

  def search
    @sp = params.fetch(:search_params, {})
    @tours = Tours.all
    @tours = @tours.where(:size => SIZE_MAPPING[@sp['size'].to_i][0]...SIZE_MAPPING[@sp['size'].to_i][1]) if @sp['size'].present?
    @tours = @tours.where(['address LIKE ?', "%#{@sp['address']}%"]) if @sp['address'].present? && @sp['address'] != ""
    @tours = @tours.where(:price => PRICE_MAPPING[@sp['price'].to_i][0]...PRICE_MAPPING[@sp['price'].to_i][1]) if @sp['price'].present?
  end

  private

  def set_tour
    @tours = @tours.find(params[:id])
  end


  def tour_params
    params.fetch(:tour, {})
    params.require(:tour).permit(:id, :price, :description, :booking_date, :start_date, :end_date, :start_location, :tour_operator_contact, :status)
  end
end
