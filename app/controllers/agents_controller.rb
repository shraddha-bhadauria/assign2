class AgentsController < ApplicationController
  def index
    @agents=Agent.all
  end

  def new
    @agents= Agent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @agents }
    end
  end

  def create
    @agents = Agent.new(agent_params)
    # @cars = Car.all
    respond_to do |format|
      if @agents.save
        # log_in @agents
        flash[:success] = "Welcome to the Tour management system!"
        format.html { redirect_to :controller => 'welcome', :action => 'index', notice: 'Agent was successfully created.' }
        # format.json { render json: @cars, status: :created, location: @cars }
      else
        format.html { render action: "new" }
        # format.json { render json: @agents.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @Agent = Agent.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @Agent }
    end
  end

  def edit
    @agents = Agent.find(params[:id])
  end

  def update
    @agents = Agent.find(params[:id])

    respond_to do |format|
      if @agents.update_attributes(agent_params)
        format.html { redirect_to @agents, notice: 'Agent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @agents.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  def agent_params
    params.require(:agent).permit(:name, :email, :password)
  end
end
