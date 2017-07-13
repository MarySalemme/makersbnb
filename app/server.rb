class MakersBnb < Sinatra::Base
  register Sinatra::Flash
  register Sinatra::Partial
  enable :sessions
  set :session_secret, 'very SuPER DUPeR secret ha ha no hack please'
  use Rack::MethodOverride

  helpers do
    def new_user
      @user = User.new(username: params[:username], email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    end

    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def booking_error(error_message)
      flash.next[:errors] = [error_message]
      redirect "/bookings/new/#{session[:space_id]}"
    end

    def empty_dates?(start_date = params[:start_date], end_date = params[:end_date])
      start_date.empty? || end_date.empty?
    end

    def invalid_dates? (start_date = params[:start_date], end_date = params[:end_date])
      Date.parse(start_date) >= Date.parse(end_date)
    end
  end
end
