class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  helper_method :current_user

  rescue_from CanCan::AccessDenied do |exception|
    flash[:notice] = "Non sei autorizzato a compiere questa azione!"
    redirect_to root_path
  end
end
