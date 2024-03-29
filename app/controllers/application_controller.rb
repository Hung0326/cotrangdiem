# frozen_string_literal: true

# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :load_category
  protect_from_forgery with: :exception

  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale = I18n.available_locales.include?(locale) ? locale : I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def load_category 
    @all_catecory = Category.all_category
  end
end
