class Customer::MessagesController < Customer::Base

  def index
    @messages = StaffMessage.customer_received(current_customer).sorted.not_deleted
      .page(params[:page])
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = CustomerMessage.new
  end


  # POST
  def confirm
    @message = CustomerMessage.new(customer_message_params)
    @message.customer = current_customer
    if @message.valid?
      render action: "confirm"
    else
      flash.now.alert = "入力に誤りがあります。"
      render action: "new"
    end
  end

  def create
    @message = CustomerMessage.new(customer_message_params)
    if params[:commit]
      @message.customer = current_customer
      if @message.save
        flash.notice = "問い合わせを送信しました。"
        redirect_to :customer_root
      else
        flash.now.alert = "入力に誤りがあります。"
        render action: "new"
      end
    else
      render action: "new"
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.update_column(:deleted, true)
    flash.notice = "メッセージを削除しました。"
    redirect_to :customer_messages
  end

  def deleted
    @messages = StaffMessage.customer_received(current_customer).deleted
      .sorted.page(params[:page])
    render action: "index"
  end

  private def customer_message_params
    params.require(:customer_message).permit(
      :subject, :body
    )
  end
end
