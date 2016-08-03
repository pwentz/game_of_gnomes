class UsersController < ApplicationController
  before_action :require_current_user, only: [:show, :update]

  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id

      authy = Authy::API.register_user(
       email: @user.email,
       cellphone: @user.phone_number,
       country_code: @user.country_code
     )
     @user.update(authy_id: authy.id)

      # flash[:notice] = "Logged in as #{current_user.username}."
      # redirect_to dashboard_path

      # Send an SMS to your user
       Authy::API.request_sms(id: @user.authy_id)

       redirect_to verify_path
    else
      flash[:notice] = "Account creation failed. Try again."
      render :new
    end
  end

  def show_verify
    return redirect_to new_user_path unless session[:user_id]
  end

  def verify
    @user = current_user

    # Use Authy to send the verification token
    token = Authy::API.verify(id: @user.authy_id, token: params[:token])

    if token.ok?
      # Mark the user as verified for get /user/:id
      @user.update(verified: true)

      # Send an SMS to the user 'success'
      send_message("You did it! Signup complete :)")

      # Show the user profile
      redirect_to user_path(@user.id)
    else
      flash.now[:danger] = "Incorrect code, please try again"
      render :show_verify
    end
  end

  def resend
    @user = current_user
    Authy::API.request_sms(id: @user.authy_id)
    flash[:notice] = "Verification code re-sent"
    redirect_to verify_path
  end

  private

  def send_message(message)
    @user = current_user
    twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    message = @client.account.messages.create(
      :from => twilio_number,
      :to => @user.country_code+@user.phone_number,
      :body => message
    )
    puts message.to
  end

  def user_params
    params.require(:user).permit(:username, :password, :email, :country_code, :phone_number, :role)
  end

  def require_current_user
    render file: "/public/404" unless current_user?
  end

  def current_user?
    current_user && current_user.default?
  end
end
