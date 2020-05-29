class Staff::TopController < Staff::Base
  skip_before_action :authorize
  skip_before_action :check_account

  def index
    if current_staff_member
      render action: "dashboard"
    else
      render action: "index"
    end
  end
end
