class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
      @user = User.from_omniauth(request.env['omniauth.auth'])

      if @user && @user.persisted?
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
        sign_in_and_redirect @user, event: :authentication
      else
        email = request.env['omniauth.auth'].info.email
        if /@colgate.edu$/ =~ email 
          @new_user = User.new(:email => email)
          @new_user.save
          sign_in_and_redirect @new_user, event: :authentication
        else
          flash[:warning] = "No user #{email} configured; contact the administrator"
          redirect_to new_user_session_path and return
        end
      end
  end
end