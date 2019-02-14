class SessionsController < ApplicationController

  def index

  end

  def new

  end

  def create

    if params[:session][:state].downcase == "admin"
      if params[:session][:email].downcase == "admin@ncsu.edu" && params[:session][:password] == "team"
        session[:member_id] = 1
        session[:email]="admin@ncsu.edu"
        redirect_to :controller => 'home', :action => 'index'

      else
        flash.now[:notice] = "Invalid email/password combination"
        render 'new'
      end

    end

    if params[:session][:state].downcase == "agent"
      user = Agent.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to :controller => 'home', :action => 'index'
      else
        flash.now[:notice] = "Invalid email/password combination"
        render 'new'
      end
    end

    if params[:session][:state].downcase == "customer"
      user = Customer.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to :controller => 'home', :action => 'index'
      else
        flash.now[:notice] = "Invalid email/password combination"
        render 'new'
      end
    end

  end
end