class AgentsController < ApplicationController
  def index
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
        log_in @agents
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
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
