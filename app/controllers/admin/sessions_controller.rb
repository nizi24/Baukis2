class Admin::SessionsController < Admin::Base

  def new
    if current_administrator
      redirect_to :admin_root
    else
      @form = Admin::LoginForm.new
      render action: "new"
    end
  end

  def create
    @form = Admin::LoginForm.new(login_form_params)
    if @form.email.present?
      admin = Administrator.find_by("LOWER(email) = ?", @form.email.downcase)
    end
    if Admin::Authenticator.new(admin).authenticate(@form.password)
      if admin.suspended?
        flash.now.alert = "アカウントが停止されています。"
      else
        session[:admin_id] = admin.id
        flash.notice = "ログインしました。"
        redirect_to :admin_root
      end
    else
      flash.now.alert = "ログインに失敗しました。"
      render action: "new"
    end
  end

  private def login_form_params
    params.require(:admin_login_form).permit(:email, :password)
  end

  def destroy
    session.delete(:admin_id)
    flash.notice = "ログアウトしました。"
    redirect_to :admin_root
  end

end
