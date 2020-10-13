class Admin::HomesController < ApplicationController
  def index
    
  end

  def redirect_to_login
    redirect_to new_administrator_session_path
  end
end
