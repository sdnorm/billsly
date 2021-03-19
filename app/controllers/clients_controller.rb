class ClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def bulk_send_reminders
    
  end

  # GET /clients
  def index
    @pagy, @clients = pagy(@account.clients.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @clients.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @clients.load
  end

  # GET /clients/1
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
    @payment_options = @account.sp_payment_links.pluck(:name, :id)
  end

  # POST /clients
  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to @client, notice: "Client was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clients/1
  def update
    if @client.update(client_params)
      redirect_to @client, notice: "Client was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /clients/1
  def destroy
    @client.destroy
    redirect_to clients_url, notice: "Client was successfully destroyed."
  end

  private

  def set_account 
    @account = current_user.accounts.first
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_client
    @client = Client.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def client_params
    params.require(:client).permit(
      :first_name, 
      :last_name, 
      :email, 
      :phone_number, 
      client_profiles_attributes: [
        :id, 
        :reminder_message,
        :payment_options,
        :_destroy
      ]
    )
  end
end
