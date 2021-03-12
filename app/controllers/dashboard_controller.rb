class DashboardController < ApplicationController

  def show
    @clients = current_account.clients
  end

end
