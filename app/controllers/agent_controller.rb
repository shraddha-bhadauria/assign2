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
    @cars = Car.all
    respond_to do |format|
      if @agents.save
        log_in @agents
        flash[:success] = "Welcome to the Sample App!"
        format.html { redirect_to :controller => 'cars', :action => 'index', notice: 'Agent was successfully created.' }
        format.json { render json: @cars, status: :created, location: @cars }
      else
        format.html { render action: "new" }
        format.json { render json: @agents.errors, status: :unprocessable_entity }
      end
    end
  end
  def createad
    @agents = Agent.new
    @agents.name = params[:name]
    @agents.email = params[:email]
    @agents.password = params[:password]
    @agents.state = "admin"
    @cars = Car.all
    respond_to do |format|
      if @agents.save
        flash[:success] = "Admin Added Successfully"
        format.html { redirect_to :controller => 'cars', :action => 'index', notice: 'Admin was successfully created.' }
        format.json { render json: @cars, status: :created, location: @cars }
      else
        format.html { render action: "new" }
        format.json { render json: @agents.errors, status: :unprocessable_entity }
      end
    end
  end
  def createsys
    @agents = Agent.new
    @agents.name = params[:name]
    @agents.email = params[:email]
    @agents.password = params[:password]
    @agents.state = "sysadmin"
    @cars = Car.all
    respond_to do |format|
      if @agents.save
        flash[:success] = "Super Admin Added Successfully"
        format.html { redirect_to :controller => 'cars', :action => 'index', notice: 'Super Admin was successfully created.' }
        format.json { render json: @cars, status: :created, location: @cars }
      else
        format.html { render action: "new" }
        format.json { render json: @agents.errors, status: :unprocessable_entity }
      end
    end
  end
  def show
    @agents = Agent.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @agents }
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
    @agents=Agent.find(params[:id])
    @history=History.find_by_email_and_status(@agents.email,"checkedout")
    if(!@history.nil?)
      flash[:notice] = "User has a checkout car. So cannot delete him/her"
    else
      @history= History.where(:email=>@agents.email,:status=>"Reserved").destroy_all
      flash[:notice] = "Removed all reserved cars for this user"
      @agents.destroy
      flash[:success] = "Agent deleted"
    end
    redirect_to agents_url
  end

  def new_sys
    render template: 'agents/new_sys'
  end

  private
  def set_agent
    @agents=Agent.find(param[:id])
  end
  def agent_params
    params.require(:agent).permit(:name, :email, :password)
  end
end