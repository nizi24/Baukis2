class Admin::Base < ApplicationController

  private def current_administrator
    if session[:admin_id]
      @administrator ||= Administrator.find_by(id: session[:admin_id])
    end
  end

  helper_method :current_administrator
end
