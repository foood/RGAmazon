class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :set_locale
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url , :alert => exception.message
  end

  helper_method :current_order

  def current_order
    if session[:order_id].present?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

private

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end

  def default_url_options(options ={})
    {locale: I18n.locale}
  end
end
