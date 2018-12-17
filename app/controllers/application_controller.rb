class ApplicationController < ActionController::Base
  private
  
  # リダイレクト先を変更するためにafter_sign_out_path_forメソッドを上書き
  # https://github.com/plataformatec/devise/wiki/How-To:-Change-the-redirect-path-after-destroying-a-session-i.e.-signing-out
  def after_sign_out_path_for(resource)
    new_user_session_path
  end
end
