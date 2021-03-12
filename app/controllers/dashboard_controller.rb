class DashboardController < ApplicationController

  def show
    @clients = current_account.clients
  end

  def client_detail
    @client = Client.find_by(id: params[:id], account_id: current_account.id)
  end

end
