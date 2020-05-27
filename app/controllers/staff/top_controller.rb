class Staff::TopController < Staff::Base
  skip_before_action :authorize
  skip_before_action :check_account

  def index
  end
end
