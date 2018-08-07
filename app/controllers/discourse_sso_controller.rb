class DiscourseSsoController < ApplicationController
  require 'single_sign_on'

  before_action :authenticate_user! # ensures user must login

  def sso
    secret = "d836444a9e4084d5b224a60c208dce14"
    sso = SingleSignOn.parse(request.query_string, secret)
    sso.email = current_user.email # from devise
    sso.name = current_user.full_name # this is a custom method on the User class
    sso.username = current_user.email # from devise
    sso.external_id = current_user.id # from devise
    sso.sso_secret = secret

    redirect_to sso.to_url("http://community.thefishing.network/session/sso_login")
  end
end
