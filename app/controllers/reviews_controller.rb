class ReviewsController < ApplicationController
  def review_params
    params.require(:review).permit(:id, :customer_id, :subject, :message_content)
  end
   def index

     @reviews = Review.all
   end

  def new
    @reviews = Review.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reviews }
    end
  end

  def create
    @reviews = Review.new(review_params)

    respond_to do |format|
      if @reviews.save
        format.html { redirect_to @reviews, notice: 'a review of a customer has been created.' }
        format.json { render json: @reviews, status: :created, location: @reviews }
      else
        format.html { render action: "new" }
        format.json { render json: @reviews.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    @reviews = Review.find(params[:id])

    respond_to do |format|
      if @reviews.update_attributes(review_params)
        format.html { redirect_to @reviews, notice: 'Review successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reviews.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @reviews = Review.find(params[:id])
    @reviews.destroy
    flash[:notice] = "review has been deleted."
    respond_to do |format|
      format.html { redirect_to_reviews_url }
      format.json { head :no_content }
    end
  end

end
