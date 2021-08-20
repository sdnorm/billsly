class StaticController < ApplicationController

  before_action :cookie_consent

  def index
    @disable_nav = true
  end

  def about
  end

  def pricing
    @disable_nav = true
    redirect_to root_path, alert: t(".no_plans") unless Plan.without_free.exists?
  end

  def terms
  end

  def privacy
  end

  def features
    @disable_nav = true
  end

  def set_cookie_consent
    cookies[:cookie_consent] = true
  end

end
