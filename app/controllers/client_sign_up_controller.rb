class ClientSignUpController < ApplicationController

  before_action :set_account

  layout "client_sign_up"

  def index
    @skip_timer = true
    @client = Client.new
    @client.client_profiles.build
  end

  def create
    @client = Client.new(client_params)
    @client.account_id = @account.id
    if @client.save
      # ClientProfile.create!(client_id: @client.id, account_id: @account.id)
      redirect_to new_client_sign_up_link_path(@account.slug), notice: "Your sign up was successful. This is going to help #{@account.name} out a lot!"
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def client_params
    params.require(:client).permit(
      :first_name, 
      :last_name, 
      :email,  
      :phone_number,
      :terms_and_conditions,
      client_profiles_attributes: [
        :address1,
        :address2,
        :city,
        :state,
        :zip_code
      ]
    )
  end

  def set_account
    @account = Account.friendly.find(params[:id])
  end

end
