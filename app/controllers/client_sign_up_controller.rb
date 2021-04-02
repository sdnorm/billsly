class ClientSignUpController < ApplicationController

  before_action :set_account

  def index
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      AccountClient.create!(client_id: @client.id, account_id: @account.id)
      ClientProfile.create!(client_id: @client.id, account_id: @account.id)
      redirect_to clients_path, notice: "Client was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def client_params
    params.require(:client).permit(
      :first_name, 
      :last_name, 
      :email, 
      :phone_number, 
      :terms_and_conditions
    )
  end

  def set_account
    @account = Account.find(params[:id])
  end

end
