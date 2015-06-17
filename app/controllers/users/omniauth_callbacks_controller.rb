# Skips the CSRF protection for the jwt action so that the session is retained
# and the user_return_to value can be used to redirect the user back to the
# page they originally requested after login.
protect_from_forgery :except => :jwt

def jwt
  raw_info = env['omniauth.auth'].extra.raw_info

  #further validation of claims adapted from https://rapid.test.aaf.edu.au/
  token_valid = (raw_info['iss'] == 'https://rapid.test.aaf.edu.au' &&
      raw_info['aud'] == 'https://example.com' &&
      Time.now > Time.at(raw_info['nbf']) &&
      Time.now < Time.at(raw_info['exp']) )

  if token_valid
    @user = User.find_for_jwt_oauth(env["omniauth.auth"]) # application specific logic
    if @user
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "jwt"
      sign_in_and_redirect @user, :event => :authentication
    else
      redirect_to user_session_path, :alert => 'Invalid admin user'
    end
  else
    redirect_to user_session_path, :alert => 'Bad token'
  end
end