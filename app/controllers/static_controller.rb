class StaticController < ApplicationController
  def index
    @disable_nav = true
  end

  def about
  end

  def pricing
    redirect_to root_path, alert: t(".no_plans") unless Plan.without_free.exists?
  end

  def terms
  end

  def privacy
  end
end
