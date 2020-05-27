class Admin::TopController < Admin::Base
  skip_before_action :authorize
  skip_before_action :check_account

  def index
    if current_administrator
      render action: "dashboard"
    else
      render action: "index"
    end
  end
end
